import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(bookmarksProvider);
    final theme = Theme.of(context);

    // 共有状態を監視してSnackBarを表示
    ref.listen<SharingState>(sharingServiceProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(child: Text(next.error!)),
              ],
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: next.isFromShareIntent ? 8 : 5),
            action: SnackBarAction(
              label: 'Dismiss',
              textColor: Colors.white,
              onPressed: () =>
                  ref.read(sharingServiceProvider.notifier).clearError(),
            ),
          ),
        );
      }

      // 処理中の表示
      if (previous?.isProcessing == false && next.isProcessing == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    next.isFromShareIntent
                        ? 'ブックマークを保存中...'
                        : 'Creating bookmark...',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.blue,
            duration: const Duration(seconds: 10),
          ),
        );
      }

      // 処理が完了した場合（成功の場合）
      if (previous?.isProcessing == true &&
          next.isProcessing == false &&
          next.error == null) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        // 共有インテントから起動された場合は特別なメッセージ
        if (next.isFromShareIntent && next.shouldAutoClose) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  Icon(Icons.bookmark_added, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(child: Text('ブックマーク保存完了！アプリを閉じます...')),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  Icon(Icons.bookmark_added, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(child: Text('Bookmark saved successfully!')),
                ],
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
        }

        // ブックマークリストを更新
        ref.invalidate(bookmarksProvider);
      }
    });

    // リフレッシュ関数
    Future<void> refreshBookmarks() async {
      try {
        ref.invalidate(bookmarksProvider);
        await ref.read(bookmarksProvider.future);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('更新に失敗しました: $e'),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.bookmark_rounded,
                        color: theme.colorScheme.onPrimary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Readeck',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your bookmarks collection',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () => context.push('/settings'),
                      icon: const Icon(Icons.settings_rounded),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: NavCard(
                        icon: Icons.bookmark_rounded,
                        title: 'Bookmarks',
                        onTap: () => context.go('/bookmarks'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: NavCard(
                        icon: Icons.search_rounded,
                        title: 'Search',
                        onTap: () {
                          // 検索ダイアログを表示
                          _showQuickSearchDialog(context, ref);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: NavCard(
                        icon: Icons.label_rounded,
                        title: 'Labels',
                        onTap: () => context.push('/labels'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: NavCard(
                        icon: Icons.collections_bookmark_rounded,
                        title: 'Collections',
                        onTap: () => context.push('/collections'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshBookmarks,
                  color: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surface,
                  strokeWidth: 2.0,
                  displacement: 40.0,
                  child: bookmarksAsync.when(
                    data: (bookmarks) => CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Recent Bookmarks',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),
                        bookmarks.isEmpty
                            ? SliverFillRemaining(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border_rounded,
                                        size: 64,
                                        color: theme.colorScheme.onSurface
                                            .withValues(alpha: 0.5),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'No bookmarks yet',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withValues(alpha: 0.7),
                                            ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Pull down to refresh',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withValues(alpha: 0.5),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final bookmark = bookmarks[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: BookmarkCard(bookmark: bookmark),
                                  );
                                }, childCount: bookmarks.length),
                              ),
                      ],
                    ),
                    loading: () => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                    error: (e, st) => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline_rounded,
                                size: 64,
                                color: theme.colorScheme.error,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Error loading bookmarks',
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Text(
                                  e.toString(),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () =>
                                    ref.invalidate(bookmarksProvider),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // クイック検索ダイアログ
  void _showQuickSearchDialog(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.search_rounded),
            SizedBox(width: 8),
            Text('Quick Search'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search bookmarks...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search_rounded),
              ),
              autofocus: true,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  // 検索を実行してブックマーク画面に遷移
                  ref.read(bookmarkListProvider.notifier).search(value.trim());
                  ref
                      .read(searchHistoryProvider.notifier)
                      .addSearch(value.trim());
                  context.pop();
                  Future.microtask(() => context.go('/bookmarks')); //*
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.pop();
                    context.push('/advanced_search');
                  },
                  icon: const Icon(Icons.tune_rounded),
                  label: const Text('Advanced'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    final query = searchController.text.trim();
                    if (query.isNotEmpty) {
                      ref.read(bookmarkListProvider.notifier).search(query);
                      ref.read(searchHistoryProvider.notifier).addSearch(query);
                      context.pop();
                      context.go('/bookmarks');
                    }
                  },
                  icon: const Icon(Icons.search_rounded),
                  label: const Text('Search'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
