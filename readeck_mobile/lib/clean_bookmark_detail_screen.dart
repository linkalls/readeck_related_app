import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'services/offline_service.dart' as offline;
import 'utils/api_client.dart';

// オフライン対応のブックマーク詳細情報（Markdown）を取得するProvider
final offlineBookmarkDetailProvider = FutureProvider.family<String, String>((
  ref,
  id,
) async {
  final apiService = offline.OfflineAwareApiService(globalApiClient, ref);

  try {
    final markdown = await apiService.getBookmarkMarkdown(id);
    // Front Matter（---で囲まれた部分）を除去
    return _removeFrontMatter(markdown);
  } catch (e) {
    print('Failed to get bookmark markdown: $e');
    rethrow;
  }
});

// オフライン対応のブックマーク情報を取得するProvider
final offlineBookmarkInfoProvider = FutureProvider.family<BookmarkInfo, String>(
  (ref, id) async {
    final apiService = offline.OfflineAwareApiService(globalApiClient, ref);

    try {
      final bookmarkInfo = await apiService.getBookmark(id);
      if (bookmarkInfo == null) {
        throw Exception('Bookmark not found');
      }
      return bookmarkInfo;
    } catch (e) {
      print('Failed to get bookmark info: $e');
      rethrow;
    }
  },
);

// Front Matterを除去する関数
String _removeFrontMatter(String markdown) {
  // ---で始まり---で終わるFront Matterを除去
  final frontMatterRegex = RegExp(
    r'^---\s*\n.*?\n---\s*\n',
    multiLine: true,
    dotAll: true,
  );
  return markdown.replaceFirst(frontMatterRegex, '').trim();
}

class BookmarkDetailScreen extends HookConsumerWidget {
  final String bookmarkId;

  const BookmarkDetailScreen({required this.bookmarkId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markdownAsync = ref.watch(offlineBookmarkDetailProvider(bookmarkId));
    final bookmarkInfoAsync = ref.watch(
      offlineBookmarkInfoProvider(bookmarkId),
    );
    final isOfflineMode = ref.watch(offline.isOfflineProvider);
    final connectivityAsync = ref.watch(offline.connectivityProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: bookmarkInfoAsync.when(
        data: (bookmark) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.primaryContainer.withOpacity(0.3),
                theme.colorScheme.surface,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // オフライン状態バナー
                _buildOfflineBanner(context, isOfflineMode, connectivityAsync),
                // ヘッダー
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton.filled(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookmark.title ?? 'No Title',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (bookmark.siteName != null)
                              Text(
                                bookmark.siteName!,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.7),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // メニューボタン
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert_rounded),
                        onSelected: (value) =>
                            _handleMenuAction(context, ref, bookmark, value),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'share',
                            child: Row(
                              children: [
                                Icon(Icons.share_rounded),
                                SizedBox(width: 8),
                                Text('共有'),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'open_browser',
                            child: Row(
                              children: [
                                Icon(Icons.open_in_browser_rounded),
                                SizedBox(width: 8),
                                Text('ブラウザで開く'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // コンテンツ
                Expanded(
                  child: markdownAsync.when(
                    data: (markdown) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: MarkdownWidget(
                        data: markdown,
                        config: MarkdownConfig(),
                      ),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) {
                      final isOnline = connectivityAsync.when(
                        data: (result) => result != ConnectivityResult.none,
                        loading: () => true,
                        error: (_, __) => false,
                      );

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isOfflineMode || !isOnline
                                      ? Icons.wifi_off_rounded
                                      : Icons.error_outline_rounded,
                                  size: 48,
                                  color: isOfflineMode || !isOnline
                                      ? Colors.orange
                                      : theme.colorScheme.error,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  isOfflineMode || !isOnline
                                      ? 'コンテンツがオフラインで利用できません'
                                      : '記事の読み込みに失敗しました',
                                  style: theme.textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  isOfflineMode || !isOnline
                                      ? 'この記事はまだローカルに保存されていません。オンラインになったときに自動的にダウンロードされます。'
                                      : e.toString(),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    ref.invalidate(
                                      offlineBookmarkDetailProvider(bookmarkId),
                                    );
                                  },
                                  icon: const Icon(Icons.refresh_rounded),
                                  label: const Text('再試行'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (e, st) {
          final isOnline = connectivityAsync.when(
            data: (result) => result != ConnectivityResult.none,
            loading: () => true,
            error: (_, __) => false,
          );

          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.primaryContainer.withOpacity(0.3),
                    theme.colorScheme.surface,
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // オフライン状態バナー
                    _buildOfflineBanner(
                      context,
                      isOfflineMode,
                      connectivityAsync,
                    ),
                    // ヘッダー
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          IconButton.filled(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              'ブックマーク詳細',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // エラー表示
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isOfflineMode || !isOnline
                                  ? Icons.wifi_off_rounded
                                  : Icons.error_outline_rounded,
                              size: 64,
                              color: isOfflineMode || !isOnline
                                  ? Colors.orange
                                  : theme.colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              isOfflineMode || !isOnline
                                  ? 'ブックマークがオフラインで利用できません'
                                  : 'ブックマークの読み込みに失敗しました',
                              style: theme.textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Text(
                                isOfflineMode || !isOnline
                                    ? 'このブックマークはまだローカルに保存されていません。オンラインになったときに再度お試しください。'
                                    : e.toString(),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () {
                                ref.invalidate(
                                  offlineBookmarkInfoProvider(bookmarkId),
                                );
                              },
                              icon: const Icon(Icons.refresh_rounded),
                              label: const Text('再試行'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // オフライン状態バナーを構築
  Widget _buildOfflineBanner(
    BuildContext context,
    bool isOfflineMode,
    AsyncValue<ConnectivityResult> connectivityAsync,
  ) {
    final isOnline = connectivityAsync.when(
      data: (result) => result != ConnectivityResult.none,
      loading: () => true,
      error: (_, __) => false,
    );

    if (isOfflineMode || !isOnline) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
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
            Icon(
              isOfflineMode
                  ? Icons.wifi_off_rounded
                  : Icons.signal_wifi_off_rounded,
              color: Colors.white,
              size: 20,
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
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  void _handleMenuAction(
    BuildContext context,
    WidgetRef ref,
    BookmarkInfo bookmark,
    String action,
  ) async {
    switch (action) {
      case 'share':
        final url = bookmark.url;
        if (url != null) {
          await Share.share('${bookmark.title ?? ""}\n$url');
        }
        break;
      case 'open_browser':
        final url = bookmark.url;
        if (url != null) {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        }
        break;
    }
  }
}
