import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';

import 'providers/providers.dart';
import 'utils/api_client.dart';

class ModernBookmarksScreen extends HookConsumerWidget {
  const ModernBookmarksScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダーから検索状態を取得
    final bookmarkListState = ref.watch(bookmarkListProvider);
    final bookmarkListNotifier = ref.read(bookmarkListProvider.notifier);

    // 検索コントローラーを初期化し、プロバイダーの状態と同期
    final searchController = useTextEditingController();

    // プロバイダーの検索クエリが変更されたら、コントローラーを更新
    useEffect(() {
      if (searchController.text != bookmarkListState.query) {
        searchController.text = bookmarkListState.query;
      }
      return null;
    }, [bookmarkListState.query]);

    // 画面の初期化時にブックマークを読み込み
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (bookmarkListState.bookmarks.isEmpty &&
            !bookmarkListState.isLoading) {
          bookmarkListNotifier.loadBookmarks(reset: true);
        }
      });
      return null;
    }, []);

    // 検索機能
    void performSearch() {
      final query = searchController.text.trim();
      bookmarkListNotifier.search(query);
      if (query.isNotEmpty) {
        ref.read(searchHistoryProvider.notifier).addSearch(query);
      }
    }

    // リフレッシュ機能
    Future<void> onRefresh() async {
      await bookmarkListNotifier.loadBookmarks(reset: true);
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(
                context,
              ).colorScheme.primaryContainer.withValues(alpha: 0.3),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ヘッダー
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        } else {
                          context.go('/');
                        }
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Bookmarks',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '${bookmarkListState.bookmarks.length} items',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),

              // 検索バー
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search bookmarks...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: bookmarkListState.query.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded),
                            onPressed: () {
                              searchController.clear();
                              bookmarkListNotifier.clearSearch();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onSubmitted: (_) => performSearch(),
                ),
              ),

              const SizedBox(height: 16),

              // ブックマークリスト
              Expanded(
                child: RefreshIndicator(
                  onRefresh: onRefresh,
                  child: _buildBookmarksList(
                    context,
                    bookmarkListState,
                    bookmarkListNotifier,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // フローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddBookmarkDialog(context, ref),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildBookmarksList(
    BuildContext context,
    BookmarkListState state,
    BookmarkListNotifier notifier,
  ) {
    if (state.isLoading && state.bookmarks.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.bookmarks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border_rounded,
              size: 64,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              state.query.isNotEmpty
                  ? 'No bookmarks found for "${state.query}"'
                  : 'No bookmarks yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.query.isNotEmpty
                  ? 'Try a different search term'
                  : 'Add your first bookmark',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: state.bookmarks.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        // 最後の5アイテムで自動的に次のページを読み込み
        if (index == state.bookmarks.length - 5 &&
            state.hasMore &&
            !state.isLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            notifier.loadMore();
          });
        }

        if (index == state.bookmarks.length) {
          // ローディングインジケーター（もっと読み込む）
          if (state.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state.hasMore) {
            // もっと読み込むボタン（手動）
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => notifier.loadMore(),
                child: const Text('Load More'),
              ),
            );
          } else {
            // これ以上データがない場合
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No more bookmarks',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            );
          }
        }

        final bookmark = state.bookmarks[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () => context.push('/bookmark/${bookmark.id}'),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookmark.title ?? 'No Title',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (bookmark.siteName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      bookmark.siteName!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                  if (bookmark.description != null &&
                      bookmark.description!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      bookmark.description!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.8),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (bookmark.labels != null &&
                      bookmark.labels!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: bookmark.labels!
                          .take(3)
                          .map(
                            (label) => Chip(
                              label: Text(
                                label,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showAddBookmarkDialog(BuildContext context, WidgetRef ref) {
    final urlController = TextEditingController();
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Bookmark'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link_rounded),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title (optional)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title_rounded),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              if (urlController.text.isNotEmpty) {
                try {
                  final api = await getApiClient();
                  await api.createBookmark(
                    BookmarkCreate(
                      url: urlController.text,
                      title: titleController.text.isNotEmpty
                          ? titleController.text
                          : null,
                    ),
                  );

                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Bookmark added successfully'),
                      ),
                    );

                    // リストを更新
                    ref
                        .read(bookmarkListProvider.notifier)
                        .loadBookmarks(reset: true);
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to add bookmark: $e')),
                    );
                  }
                }
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
