import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'services/database_service.dart';
import 'services/offline_service.dart' as offline;

// シンプルなブックマーク詳細取得関数
Future<String> getBookmarkContent(String id, WidgetRef ref) async {
  print('=== Getting bookmark content for $id ===');
  
  // まずキャッシュを確認
  final hasCache = await DatabaseService.hasBookmarkContent(id);
  final cached = hasCache ? await DatabaseService.getBookmarkContent(id) : null;
  
  print('Cache status for $id: hasCache=$hasCache, cachedLength=${cached?.length ?? 0}');
  
  // オフライン状態をチェック
  final isOfflineMode = ref.read(offline.isOfflineProvider);
  final connectivityAsync = ref.read(offline.connectivityProvider);
  final isOnline = await connectivityAsync.when(
    data: (result) async => result != ConnectivityResult.none,
    loading: () async => false,
    error: (_, __) async => false,
  );

  print('Network status for $id: offline=$isOfflineMode, online=$isOnline');

  // オフラインまたは接続なしの場合
  if (isOfflineMode || !isOnline) {
    if (cached != null && cached.trim().isNotEmpty) {
      print('Using cached content offline for $id');
      return _removeFrontMatter(cached);
    }
    throw Exception('No cached content available offline for $id');
  }

  // オンラインの場合
  // キャッシュがあれば先に返す（高速表示）
  if (cached != null && cached.trim().isNotEmpty) {
    print('Returning cached content for $id (will update in background)');
    // バックグラウンドで更新
    _updateContentInBackground(id, ref);
    return _removeFrontMatter(cached);
  }

  // キャッシュがない場合はオンライン取得
  try {
    print('Fetching fresh content for $id');
    final apiService = offline.OfflineAwareApiService(globalApiClient, ref);
    final markdown = await apiService.getBookmarkMarkdown(id);
    
    // 保存
    try {
      await DatabaseService.saveBookmarkContent(id, markdown);
      print('Cached fresh content for $id');
    } catch (e) {
      print('Failed to cache content for $id: $e');
    }
    
    return _removeFrontMatter(markdown);
  } catch (e) {
    print('Failed to fetch content for $id: $e');
    
    // 失敗時、古いキャッシュでもあれば使用
    if (cached != null && cached.trim().isNotEmpty) {
      print('Using stale cache after API failure for $id');
      return _removeFrontMatter(cached);
    }
    
    throw Exception('Failed to load content and no cache available for $id');
  }
}

// バックグラウンドでコンテンツを更新
void _updateContentInBackground(String id, WidgetRef ref) {
  Future(() async {
    try {
      print('Background update for $id');
      final apiService = offline.OfflineAwareApiService(globalApiClient, ref);
      final markdown = await apiService.getBookmarkMarkdown(id);
      await DatabaseService.saveBookmarkContent(id, markdown);
      print('Background update completed for $id');
    } catch (e) {
      print('Background update failed for $id: $e');
    }
  });
}

// オフライン対応のブックマーク情報を取得するProvider
final offlineBookmarkInfoProvider = FutureProvider.family<BookmarkInfo, String>(
  (ref, id) async {
    final apiService = offline.OfflineAwareApiService(globalApiClient, ref);
    final isOfflineMode = ref.read(offline.isOfflineProvider);
    final connectivityAsync = ref.read(offline.connectivityProvider);
    
    // 接続状態を確認
    final isOnline = await connectivityAsync.when(
      data: (result) async => result != ConnectivityResult.none,
      loading: () async => true,
      error: (_, __) async => false,
    );

    // まず、ローカルキャッシュの存在を確認
    final cachedBookmark = await DatabaseService.getBookmark(id);
    print('Bookmark info $id cache status: ${cachedBookmark != null}, offline: $isOfflineMode, online: $isOnline');

    // オフライン時またはキャッシュ優先の場合
    if (isOfflineMode || !isOnline) {
      if (cachedBookmark != null) {
        print('Using cached bookmark info for $id (offline mode)');
        return BookmarkInfo(
          id: cachedBookmark.id,
          title: cachedBookmark.title,
          url: cachedBookmark.url,
          description: cachedBookmark.description,
          created: cachedBookmark.created,
          updated: cachedBookmark.updated,
          labels: cachedBookmark.labels,
          isMarked: cachedBookmark.isMarked,
        );
      }
      throw Exception('Bookmark not found in offline cache for bookmark $id');
    }

    // オンライン時の処理
    try {
      print('Attempting to fetch bookmark info $id from API');
      final bookmarkInfo = await apiService.getBookmark(id);
      if (bookmarkInfo == null) {
        throw Exception('Bookmark not found on server');
      }
      print('Successfully fetched bookmark info $id from API');
      return bookmarkInfo;
    } catch (e) {
      print('API failed for bookmark info $id: $e');
      
      // APIが失敗した場合、キャッシュにフォールバック
      if (cachedBookmark != null) {
        print('Falling back to cached bookmark info for $id');
        return BookmarkInfo(
          id: cachedBookmark.id,
          title: cachedBookmark.title,
          url: cachedBookmark.url,
          description: cachedBookmark.description,
          created: cachedBookmark.created,
          updated: cachedBookmark.updated,
          labels: cachedBookmark.labels,
          isMarked: cachedBookmark.isMarked,
        );
      }
      
      // キャッシュもない場合はエラーを投げる
      throw Exception('Failed to load bookmark info from API and no cache available: $e');
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
    final bookmarkInfoAsync = ref.watch(offlineBookmarkInfoProvider(bookmarkId));
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
                                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            const SizedBox(height: 4),
                            // データソースバッジ
                            _buildDataSourceBadge(context, bookmarkId),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // メニューボタン
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert_rounded),
                        onSelected: (value) => _handleMenuAction(context, ref, bookmark, value),
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
                  child: FutureBuilder<String>(
                    future: getBookmarkContent(bookmarkId, ref),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      
                      if (snapshot.hasError) {
                        final e = snapshot.error!;
                        final isOnline = connectivityAsync.when(
                          data: (result) => result != ConnectivityResult.none,
                          loading: () => true,
                          error: (_, __) => false,
                        );

                        // エラーの種類を判定
                        final isNotFoundInCache = e.toString().contains('No cached content') || 
                                               e.toString().contains('no cache available');
                        final isOfflineIssue = isOfflineMode || !isOnline;

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    isOfflineIssue
                                        ? Icons.wifi_off_rounded
                                        : isNotFoundInCache
                                            ? Icons.download_rounded
                                            : Icons.error_outline_rounded,
                                    size: 48,
                                    color: isOfflineIssue
                                        ? Colors.orange
                                        : isNotFoundInCache
                                            ? Colors.blue
                                            : theme.colorScheme.error,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    isOfflineIssue
                                        ? 'コンテンツがオフラインで利用できません'
                                        : isNotFoundInCache
                                            ? 'コンテンツがダウンロードされていません'
                                            : '記事の読み込みに失敗しました',
                                    style: theme.textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    isOfflineIssue
                                        ? 'この記事はまだローカルに保存されていません。インターネットに接続してコンテンツをダウンロードしてください。'
                                        : isNotFoundInCache
                                            ? 'オンラインになったときに自動的にダウンロードされます。または手動で再試行してください。'
                                            : 'ネットワークエラーまたはサーバーエラーが発生しました。しばらく後に再試行してください。',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  if (!isOfflineIssue) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      'エラー詳細: ${e.toString()}',
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                                        fontFamily: 'monospace',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  // キャッシュ状況表示
                                  _buildCacheStatusWidget(context, bookmarkId),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          // FutureBuilderを再実行するために状態を更新
                                          (context as Element).markNeedsBuild();
                                        },
                                        icon: const Icon(Icons.refresh_rounded),
                                        label: const Text('再試行'),
                                      ),
                                      if (isOfflineMode) ...[
                                        const SizedBox(width: 12),
                                        OutlinedButton.icon(
                                          onPressed: () {
                                            ref.read(offline.isOfflineProvider.notifier).state = false;
                                            (context as Element).markNeedsBuild();
                                          },
                                          icon: const Icon(Icons.wifi_rounded),
                                          label: const Text('オンライン'),
                                        ),
                                      ],
                                      // デバッグボタン
                                      const SizedBox(width: 12),
                                      OutlinedButton.icon(
                                        onPressed: () async {
                                          await DatabaseService.printAllBookmarksDebug();
                                          await DatabaseService.getBookmarkDebugInfo(bookmarkId);
                                        },
                                        icon: const Icon(Icons.bug_report_rounded),
                                        label: const Text('デバッグ'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      
                      // 成功時はMarkdownコンテンツを表示
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: _buildMarkdownWidget(context, snapshot.data!),
                        );
                      }
                      
                      return const Center(child: Text('データがありません'));
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (e, st) {
          final isOnline = connectivityAsync.when(
            data: (result) => result != ConnectivityResult.none,
            loading: () => true,
            error: (_, __) => false,
          );

          // エラーの種類を判定
          final isNotFoundInCache = e.toString().contains('Bookmark not found');
          final isOfflineIssue = isOfflineMode || !isOnline;

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
                              isOfflineIssue
                                  ? Icons.wifi_off_rounded
                                  : isNotFoundInCache
                                      ? Icons.bookmark_border_rounded
                                      : Icons.error_outline_rounded,
                              size: 64,
                              color: isOfflineIssue
                                  ? Colors.orange
                                  : isNotFoundInCache
                                      ? Colors.blue
                                      : theme.colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              isOfflineIssue
                                  ? 'ブックマークがオフラインで利用できません'
                                  : isNotFoundInCache
                                      ? 'ブックマークが見つかりません'
                                      : 'ブックマークの読み込みに失敗しました',
                              style: theme.textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                isOfflineIssue
                                    ? 'このブックマークはまだローカルに保存されていません。インターネットに接続してデータをダウンロードしてください。'
                                    : isNotFoundInCache
                                        ? 'このブックマークは削除されたか、まだ同期されていません。'
                                        : 'ネットワークエラーまたはサーバーエラーが発生しました。',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            if (!isOfflineIssue) ...[
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  'エラー詳細: ${e.toString()}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                                    fontFamily: 'monospace',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    ref.invalidate(offlineBookmarkInfoProvider(bookmarkId));
                                  },
                                  icon: const Icon(Icons.refresh_rounded),
                                  label: const Text('再試行'),
                                ),
                                if (isOfflineMode) ...[
                                  const SizedBox(width: 12),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      ref.read(offline.isOfflineProvider.notifier).state = false;
                                      ref.invalidate(offlineBookmarkInfoProvider(bookmarkId));
                                    },
                                    icon: const Icon(Icons.wifi_rounded),
                                    label: const Text('オンライン'),
                                  ),
                                ],
                              ],
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
    AsyncValue<ConnectivityResult> connectivityAsync
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
              isOfflineMode ? Icons.wifi_off_rounded : Icons.signal_wifi_off_rounded,
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

  // データソース表示バッジ
  Widget _buildDataSourceBadge(BuildContext context, String bookmarkId) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: DatabaseService.getBookmarkDebugInfo(bookmarkId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
          final data = snapshot.data!;
        final hasContent = data['has_content'] ?? false;
        final theme = Theme.of(context);
        
        if (!hasContent) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.offline_bolt_rounded,
                size: 14,
                color: Colors.green,
              ),
              const SizedBox(width: 4),
              Text(
                'オフライン対応',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // キャッシュ状況表示ウィジェット
  Widget _buildCacheStatusWidget(BuildContext context, String bookmarkId) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: DatabaseService.getBookmarkDebugInfo(bookmarkId),
      builder: (context, snapshot) {        final debugInfo = snapshot.data;
        final hasContent = debugInfo?['has_content'] ?? false;
        final theme = Theme.of(context);
        
        // デバッグ情報をログに出力
        if (debugInfo != null) {
          print('Cache status widget debug: $debugInfo');
        }
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: hasContent 
                ? Colors.green.withOpacity(0.1)
                : Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: hasContent 
                  ? Colors.green.withOpacity(0.3)
                  : Colors.orange.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Icon(
                hasContent 
                    ? Icons.offline_bolt_rounded
                    : Icons.cloud_download_rounded,
                size: 16,
                color: hasContent ? Colors.green : Colors.orange,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(                  hasContent 
                      ? 'オフライン対応'
                      : 'コンテンツ未ダウンロード',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: hasContent ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ダークモード対応のMarkdownWidget構築
  Widget _buildMarkdownWidget(BuildContext context, String data) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    
    // テーマに応じたMarkdownConfigを作成
    final config = MarkdownConfig(
      configs: [
        // Pre（コードブロック）の設定
        PreConfig(
          textStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'monospace',
            color: isDark ? Colors.green[300] : Colors.green[800],
          ),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
            ),
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
        // 段落の設定
        PConfig(
          textStyle: TextStyle(
            fontSize: 16,
            height: 1.8,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        // 見出しの設定
        H1Config(
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
            height: 1.2,
          ),
        ),
        H2Config(
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
            height: 1.3,
          ),
        ),
        H3Config(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
            height: 1.4,
          ),
        ),
        H4Config(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
            height: 1.4,
          ),
        ),
        // リンクの設定
        LinkConfig(
          style: TextStyle(
            color: theme.colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
        // コードスパンの設定
        CodeConfig(
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'monospace',
            color: isDark ? Colors.orange[300] : Colors.orange[800],
            backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
          ),
        ),
      ],
    );
    
    return MarkdownWidget(
      data: data,
      config: config,
    );
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
