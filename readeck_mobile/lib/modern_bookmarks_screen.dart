import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';

import 'main.dart' as app_main;
import 'services/database_service.dart';
import 'services/offline_service.dart' as offline;

class ModernBookmarksScreen extends HookConsumerWidget {
  const ModernBookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isOfflineMode = ref.watch(offline.isOfflineProvider);
    final connectivityAsync = ref.watch(offline.connectivityProvider);

    // ブックマークリストの状態
    final bookmarksState = useState<List<BookmarkSummary>?>(null);
    final isLoading = useState(false);
    final isRefreshing = useState(false);
    final error = useState<String?>(null);
    final searchController = useTextEditingController();

    // データ取得関数
    Future<void> loadBookmarks({bool isRefresh = false}) async {
      print('loadBookmarks called with isRefresh: $isRefresh');

      if (isRefresh) {
        isRefreshing.value = true;
      } else {
        isLoading.value = true;
      }
      error.value = null;

      try {
        List<BookmarkSummary> bookmarks;

        if (isOfflineMode) {
          print('Loading bookmarks from database (offline mode)');
          bookmarks = await DatabaseService.getBookmarks(
            limit: 50,
            query: searchController.text.isNotEmpty
                ? searchController.text
                : null,
          );
        } else {
          final List<ConnectivityResult> connectivityResults =
              await Connectivity().checkConnectivity();
          final isOnlineNow = !connectivityResults.contains(
            ConnectivityResult.none,
          );

          if (isOnlineNow) {
            try {
              print('Loading bookmarks from API');
              final api = await app_main.getApiClient();
              bookmarks = await api.listBookmarks(
                limit: 50,
                search: searchController.text.isNotEmpty
                    ? searchController.text
                    : null,
              );
              await DatabaseService.saveBookmarks(bookmarks);
              print(
                'Bookmarks loaded from API successfully: ${bookmarks.length} items',
              );

              // バックグラウンドで記事コンテンツを事前ダウンロード（最初の5件）
              final apiService = offline.OfflineAwareApiService(
                app_main.globalApiClient,
                ref,
              );
              final idsToPreload = bookmarks
                  .take(5)
                  .where((b) => b.id != null)
                  .map((b) => b.id!)
                  .toList();

              if (idsToPreload.isNotEmpty) {
                print(
                  'Starting background prefetch for ${idsToPreload.length} articles',
                );
                apiService
                    .prefetchMultipleBookmarkContents(idsToPreload)
                    .catchError((e) {
                      print('Background prefetch failed: $e');
                    });
              }
            } catch (apiError) {
              print('API error, falling back to database: $apiError');
              bookmarks = await DatabaseService.getBookmarks(
                limit: 50,
                query: searchController.text.isNotEmpty
                    ? searchController.text
                    : null,
              );
            }
          } else {
            print('No internet connection, loading from database');
            bookmarks = await DatabaseService.getBookmarks(
              limit: 50,
              query: searchController.text.isNotEmpty
                  ? searchController.text
                  : null,
            );
          }
        }

        bookmarksState.value = bookmarks;
        error.value = null;
        print('Bookmarks state updated with ${bookmarks.length} items');
      } catch (e) {
        print('Error loading bookmarks: $e');
        error.value = e.toString();
        try {
          final cached = await DatabaseService.getBookmarks(limit: 50);
          bookmarksState.value = cached;
          if (cached.isNotEmpty) {
            error.value = null;
          }
        } catch (_) {
          bookmarksState.value = [];
        }
      } finally {
        isLoading.value = false;
        isRefreshing.value = false;
      }
    }

    // リフレッシュ用の関数
    Future<void> handleRefresh() async {
      print('========== RefreshIndicator onRefresh called ==========');
      try {
        error.value = null;
        await loadBookmarks(isRefresh: true);
        print(
          '========== RefreshIndicator onRefresh completed successfully ==========',
        );

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('ブックマークを更新しました'),
              duration: const Duration(seconds: 1),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      } catch (e) {
        print('========== RefreshIndicator onRefresh error: $e ==========');

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('更新に失敗しました: $e'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }

        rethrow;
      }
    } // 初回データ読み込み

    useEffect(() {
      loadBookmarks();
      return null;
    }, []); // 検索デバウンス用のタイマー
    final searchDebounce = useRef<Timer?>(null);
    final lastSearchText = useRef<String>('');

    // 検索テキストの変更を監視
    useEffect(() {
      void listener() {
        final currentText = searchController.text;

        // 前回と同じテキストの場合は何もしない
        if (currentText == lastSearchText.value) return;

        // 既存のタイマーをキャンセル
        searchDebounce.value?.cancel();

        // 新しいタイマーを設定（500ms後に実行）
        searchDebounce.value = Timer(const Duration(milliseconds: 500), () {
          lastSearchText.value = currentText;
          print('Search text changed to: "$currentText"');
          loadBookmarks();
        });
      }

      searchController.addListener(listener);
      return () {
        searchController.removeListener(listener);
        searchDebounce.value?.cancel();
      };
    }, [searchController]);

    // 接続状態の変化を監視
    useEffect(() {
      final connectivitySubscription = connectivityAsync.when(
        data: (result) {
          if (result != ConnectivityResult.none) {
            final apiService = offline.OfflineAwareApiService(
              app_main.globalApiClient,
              ref,
            );
            apiService.autoSync();
          }
          return null;
        },
        loading: () => null,
        error: (_, __) => null,
      );

      return connectivitySubscription;
    }, [connectivityAsync]);

    // オフライン状態の表示
    Widget buildConnectionBanner() {
      final isOnline = connectivityAsync.when(
        data: (result) => result != ConnectivityResult.none,
        loading: () => true,
        error: (_, __) => false,
      );

      if (isOfflineMode || !isOnline) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: isOfflineMode
                      ? [Colors.orange.shade400, Colors.orange.shade600]
                      : [Colors.red.shade400, Colors.red.shade600],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isOfflineMode
                          ? Icons.wifi_off_rounded
                          : Icons.signal_wifi_off_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isOfflineMode ? 'オフラインモード' : 'インターネット接続なし',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'キャッシュデータを表示中',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isOfflineMode) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          ref.read(offline.isOfflineProvider.notifier).state =
                              false;
                          handleRefresh();
                        },
                        child: const Text(
                          'オンライン',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    IconButton(
                      onPressed: () => handleRefresh(),
                      icon: const Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      tooltip: '再試行',
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // モダンなヘッダー
              Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    IconButton.filled(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bookmarks',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${bookmarksState.value?.length ?? 0} items',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.7),
                                ),
                          ),
                        ],
                      ),
                    ),
                    IconButton.filledTonal(
                      icon: Icon(isOfflineMode ? Icons.wifi_off : Icons.wifi),
                      onPressed: () {
                        ref.read(offline.isOfflineProvider.notifier).state =
                            !isOfflineMode;
                        handleRefresh();
                      },
                      tooltip: isOfflineMode
                          ? 'オンラインモードに切り替え'
                          : 'オフラインモードに切り替え',
                    ),
                    const SizedBox(width: 8),
                    IconButton.filledTonal(
                      icon: const Icon(Icons.add_rounded),
                      onPressed: () =>
                          _showAddBookmarkDialog(context, ref, loadBookmarks),
                    ),
                  ],
                ),
              ),
              // 接続状態バナー
              buildConnectionBanner(),
              // 美しい検索バー
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: searchController,
                    builder: (context, value, child) {
                      return TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'ブックマークを検索...',
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          suffixIcon: value.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear_rounded),
                                  onPressed: () {
                                    searchController.clear();
                                    // clearした後すぐに検索を実行
                                    Future.delayed(
                                      const Duration(milliseconds: 100),
                                      () {
                                        loadBookmarks();
                                      },
                                    );
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                        onSubmitted: (_) => loadBookmarks(),
                      );
                    },
                  ),
                ),
              ),
              // ブックマークリスト
              Expanded(
                child: RefreshIndicator(
                  onRefresh: handleRefresh,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  strokeWidth: 2.5,
                  displacement: 50.0,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  notificationPredicate: (notification) {
                    print('Scroll notification: ${notification.runtimeType}');
                    return notification.depth == 0;
                  },
                  child: Builder(
                    builder: (context) {
                      if (isLoading.value && bookmarksState.value == null) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 16),
                                  Text('ブックマークを読み込み中...'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ],
                        );
                      }

                      if (error.value != null && bookmarksState.value == null) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64,
                                    color: isDark
                                        ? Colors.red[200]
                                        : Colors.red,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'エラーが発生しました',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32,
                                    ),
                                    child: Text(
                                      error.value!,
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.grey[300]
                                            : Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => loadBookmarks(),
                                    child: const Text('再試行'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                          ],
                        );
                      }

                      final bookmarks = bookmarksState.value ?? [];
                      if (bookmarks.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          padding: EdgeInsets.zero,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.bookmark_border,
                                      size: 64,
                                      color: isDark
                                          ? Colors.grey[400]
                                          : Colors.grey[600],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'ブックマークがありません',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isDark
                                            ? Colors.grey[400]
                                            : Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '下に引っ張って更新',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isDark
                                            ? Colors.grey[500]
                                            : Colors.grey[500],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton.icon(
                                      onPressed: () => handleRefresh(),
                                      icon: const Icon(Icons.refresh),
                                      label: const Text('手動更新'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                          ],
                        );
                      }

                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                        itemCount:
                            bookmarks.length + (isRefreshing.value ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == bookmarks.length && isRefreshing.value) {
                            return Container(
                              padding: const EdgeInsets.all(24),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          final bookmark = bookmarks[index];
                          return _buildBookmarkCard(
                            context,
                            bookmark,
                            ref,
                            handleRefresh,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 美しいブックマークカードを構築
  Widget _buildBookmarkCard(
    BuildContext context,
    BookmarkSummary bookmark,
    WidgetRef ref,
    VoidCallback onRefresh,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.1),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () async {
            if (bookmark.id != null) {
              // ブックマーク情報をDBに保存して詳細画面で利用可能にする
              try {
                await DatabaseService.saveBookmark(bookmark);
                print('Bookmark ${bookmark.id} saved to DB before navigation');

                // 記事内容も事前ダウンロード（バックグラウンドで実行）
                final apiService = offline.OfflineAwareApiService(
                  app_main.globalApiClient,
                  ref,
                );
                apiService.prefetchBookmarkContent(bookmark.id!).catchError((
                  e,
                ) {
                  print('Failed to prefetch content for ${bookmark.id}: $e');
                });
              } catch (e) {
                print('Failed to save bookmark to DB: $e');
              }

              if (context.mounted) {
                context.push('/bookmark/${bookmark.id}');
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ヘッダー行
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: bookmark.isMarked == true
                            ? Colors.amber.withOpacity(0.2)
                            : Theme.of(
                                context,
                              ).colorScheme.primaryContainer.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        bookmark.isMarked == true
                            ? Icons.star_rounded
                            : Icons.bookmark_rounded,
                        color: bookmark.isMarked == true
                            ? Colors.amber.shade700
                            : Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        bookmark.title ?? 'タイトルなし',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert_rounded,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'open',
                          child: Row(
                            children: [
                              Icon(Icons.open_in_browser_rounded),
                              SizedBox(width: 12),
                              Text('ブラウザで開く'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'share',
                          child: Row(
                            children: [
                              Icon(Icons.share_rounded),
                              SizedBox(width: 12),
                              Text('共有'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete_rounded, color: Colors.red),
                              SizedBox(width: 12),
                              Text('削除', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                      onSelected: (value) => _handleBookmarkAction(
                        value,
                        bookmark,
                        context,
                        ref,
                        onRefresh,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // 説明文
                if (bookmark.description != null &&
                    bookmark.description!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      bookmark.description!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.8),
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                // URL
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.link_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          bookmark.url ?? '',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // ラベル
                if (bookmark.labels != null && bookmark.labels!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: bookmark.labels!.take(3).map((label) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            label,
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddBookmarkDialog(
    BuildContext context,
    WidgetRef ref,
    VoidCallback onRefresh,
  ) {
    final urlController = TextEditingController();
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(
              Icons.bookmark_add_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            const Text('新しいブックマーク'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                labelText: 'URL',
                hintText: 'https://example.com',
                prefixIcon: const Icon(Icons.link_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'タイトル（オプション）',
                prefixIcon: const Icon(Icons.title_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('キャンセル'),
          ),
          FilledButton.icon(
            onPressed: () async {
              if (urlController.text.isNotEmpty) {
                try {
                  final apiService = offline.OfflineAwareApiService(
                    app_main.globalApiClient,
                    ref,
                  );
                  await apiService.createBookmark(
                    urlController.text,
                    title: titleController.text.isNotEmpty
                        ? titleController.text
                        : null,
                  );
                  context.pop();
                  onRefresh();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ブックマークを追加しました')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('エラー: $e')));
                }
              }
            },
            icon: const Icon(Icons.add_rounded),
            label: const Text('追加'),
          ),
        ],
      ),
    );
  }

  void _handleBookmarkAction(
    String action,
    BookmarkSummary bookmark,
    BuildContext context,
    WidgetRef ref,
    VoidCallback onRefresh,
  ) async {
    switch (action) {
      case 'open':
        // URL Launcherで開く（将来実装）
        break;
      case 'share':
        // 共有機能（将来実装）
        break;
      case 'delete':
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            icon: Icon(Icons.delete_rounded, color: Colors.red, size: 32),
            title: const Text('ブックマークを削除'),
            content: const Text('このブックマークを削除しますか？'),
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: const Text('キャンセル'),
              ),
              FilledButton.icon(
                onPressed: () => context.pop(true),
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.delete_rounded),
                label: const Text('削除'),
              ),
            ],
          ),
        );

        if (confirmed == true && bookmark.id != null) {
          try {
            final apiService = offline.OfflineAwareApiService(
              app_main.globalApiClient,
              ref,
            );
            await apiService.deleteBookmark(bookmark.id!);
            onRefresh();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('ブックマークを削除しました')));
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('削除エラー: $e')));
          }
        }
        break;
    }
  }
}
