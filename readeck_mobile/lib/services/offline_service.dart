import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';

import 'database_service.dart';

// 接続状態のプロバイダー（最新のconnectivity_plus APIに対応）
final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  return Connectivity().onConnectivityChanged.map((
    List<ConnectivityResult> results,
  ) {
    // 複数の接続タイプがある場合は、noneでない最初のものを返す
    // noneしかない場合はnoneを返す
    for (final result in results) {
      if (result != ConnectivityResult.none) {
        return result;
      }
    }
    return ConnectivityResult.none;
  });
});

// オフラインモードの状態管理
final isOfflineProvider = StateProvider<bool>((ref) => false);

// API呼び出しのラッパークラス
class OfflineAwareApiService {
  final ReadeckApiClient? _apiClient;
  final dynamic _ref; // WidgetRefまたはProviderRefを受け取れるように

  OfflineAwareApiService(this._apiClient, this._ref);
  bool get isOnline {
    final connectivity = _ref.read(connectivityProvider).value;
    final isOfflineMode = _ref.read(isOfflineProvider);
    return !isOfflineMode &&
        connectivity != null &&
        connectivity != ConnectivityResult.none;
  }

  // 接続状態をチェックする新しいメソッド
  Future<bool> checkConnectivity() async {
    try {
      final List<ConnectivityResult> results = await Connectivity()
          .checkConnectivity();
      return !results.contains(ConnectivityResult.none);
    } catch (e) {
      return false;
    }
  }

  // ブックマーク一覧取得（オフライン対応・改善版）
  Future<List<BookmarkSummary>> getBookmarks({
    int limit = 20,
    int offset = 0,
    String? query,
    bool forceRefresh = false,
  }) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (!isOfflineMode && isConnected && _apiClient != null) {
      try {
        final bookmarks = await _apiClient.listBookmarks(
          limit: limit,
          offset: offset,
          search: query,
        );

        // オンラインデータをキャッシュ（新しいデータの場合のみ）
        if (offset == 0 || forceRefresh) {
          await DatabaseService.saveBookmarks(bookmarks);
        }
        return bookmarks;
      } catch (e) {
        // API呼び出し失敗時はオフラインデータを使用
        print('API call failed, falling back to cache: $e');
        return await DatabaseService.getBookmarks(
          limit: limit,
          offset: offset,
          query: query,
        );
      }
    } else {
      // オフライン時はローカルデータを返す
      return await DatabaseService.getBookmarks(
        limit: limit,
        offset: offset,
        query: query,
      );
    }
  }

  // ブックマーク作成（オフライン対応・改善版）
  Future<void> createBookmark(String url, {String? title}) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (!isOfflineMode && isConnected && _apiClient != null) {
      try {
        final bookmarkCreate = BookmarkCreate(url: url, title: title);
        await _apiClient.createBookmark(bookmarkCreate);
      } catch (e) {
        // オフライン時は保留アクションとして保存
        print('Failed to create bookmark online, saving as pending: $e');
        await DatabaseService.savePendingAction('create_bookmark', {
          'url': url,
          'title': title,
        });
        rethrow;
      }
    } else {
      // オフライン時は保留アクションとして保存
      await DatabaseService.savePendingAction('create_bookmark', {
        'url': url,
        'title': title,
      });
      throw Exception('オフラインモードです。接続時に同期されます。');
    }
  }

  // ブックマーク削除（オフライン対応・改善版）
  Future<void> deleteBookmark(String bookmarkId) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (!isOfflineMode && isConnected && _apiClient != null) {
      try {
        await _apiClient.deleteBookmark(bookmarkId);
        // 成功したらローカルからも削除
        await DatabaseService.deleteBookmark(bookmarkId);
      } catch (e) {
        // オフライン時は保留アクションとして保存
        print('Failed to delete bookmark online, saving as pending: $e');
        await DatabaseService.savePendingAction('delete_bookmark', {
          'id': bookmarkId,
        });
        rethrow;
      }
    } else {
      // オフライン時は保留アクションとして保存
      await DatabaseService.savePendingAction('delete_bookmark', {
        'id': bookmarkId,
      });
      throw Exception('オフラインモードです。接続時に同期されます。');
    }
  }

  // 個別ブックマーク取得（オフライン対応）
  Future<BookmarkInfo?> getBookmark(String id) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (!isOfflineMode && isConnected && _apiClient != null) {
      try {
        final bookmarkInfo = await _apiClient.getBookmark(id);
        // オンラインで取得できた場合はキャッシュに保存
        await DatabaseService.saveBookmarkInfo(bookmarkInfo);
        return bookmarkInfo;
      } catch (e) {
        print('API call failed for bookmark $id, falling back to cache: $e');
        // API失敗時はローカルデータにフォールバック
        final cachedBookmark = await DatabaseService.getBookmark(id);
        if (cachedBookmark != null) {
          print('Successfully retrieved cached bookmark info for $id');
          // BookmarkSummaryからBookmarkInfoに変換
          return _convertToBookmarkInfo(cachedBookmark);
        }
        print('No cached bookmark info found for $id');
        throw Exception(
          'API failed and no cached bookmark available for $id: $e',
        );
      }
    } else {
      print('Offline mode or no connection, trying cache for bookmark $id');
      // オフライン時はローカルデータを返す
      final cachedBookmark = await DatabaseService.getBookmark(id);
      if (cachedBookmark != null) {
        print('Successfully retrieved cached bookmark info for $id (offline)');
        return _convertToBookmarkInfo(cachedBookmark);
      }
      print('No cached bookmark info found for $id (offline)');
      throw Exception('Bookmark not found in offline cache for bookmark $id');
    }
  }

  // ブックマークのマークダウンコンテンツ取得（オフライン対応）
  Future<String> getBookmarkMarkdown(String id) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (!isOfflineMode && isConnected && _apiClient != null) {
      try {
        final markdown = await _apiClient.exportBookmark(id, "md");
        // オンラインで取得できた場合はキャッシュに保存
        await DatabaseService.saveBookmarkContent(id, markdown);
        return markdown;
      } catch (e) {
        print(
          'API call failed for bookmark markdown $id, falling back to cache: $e',
        );
        // API失敗時はローカルデータにフォールバック
        final cached = await DatabaseService.getBookmarkContent(id);
        if (cached != null) {
          print('Successfully retrieved cached content for bookmark $id');
          return cached;
        }
        print('No cached content found for bookmark $id');
        throw Exception(
          'API failed and no cached content available for bookmark $id: $e',
        );
      }
    } else {
      print('Offline mode or no connection, trying cache for bookmark $id');
      // オフライン時はローカルデータを返す
      final cached = await DatabaseService.getBookmarkContent(id);
      if (cached != null) {
        print(
          'Successfully retrieved cached content for bookmark $id (offline)',
        );
        return cached;
      }
      print('No cached content found for bookmark $id (offline)');
      throw Exception(
        'Bookmark content not found in offline cache for bookmark $id',
      );
    }
  }

  // ブックマークのコンテンツを事前ダウンロード（オフライン用）
  Future<void> prefetchBookmarkContent(String id) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    // オフラインモードまたは接続なしの場合は何もしない
    if (isOfflineMode || !isConnected || _apiClient == null) {
      print('Cannot prefetch content for $id: offline or no connection');
      return;
    }

    try {
      // 既にキャッシュされているかチェック
      final hasCache = await DatabaseService.hasBookmarkContent(id);
      if (hasCache) {
        print('Content for bookmark $id already cached, skipping prefetch');
        return;
      }

      print('Prefetching content for bookmark $id');
      final markdown = await _apiClient.exportBookmark(id, "md");
      await DatabaseService.saveBookmarkContent(id, markdown);
      print('Successfully prefetched and cached content for bookmark $id');
    } catch (e) {
      print('Failed to prefetch content for bookmark $id: $e');
      // プリフェッチの失敗は無視（必須ではない）
    }
  }

  // 複数のブックマークコンテンツを一括事前ダウンロード
  Future<void> prefetchMultipleBookmarkContents(List<String> ids) async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (isOfflineMode || !isConnected || _apiClient == null) {
      print('Cannot prefetch contents: offline or no connection');
      return;
    }

    print('Starting batch prefetch for ${ids.length} bookmarks');
    int successful = 0;
    int failed = 0;

    for (final id in ids) {
      try {
        await prefetchBookmarkContent(id);
        successful++;
      } catch (e) {
        failed++;
        print('Prefetch failed for bookmark $id: $e');
      }

      // レート制限を避けるために少し待機
      await Future.delayed(const Duration(milliseconds: 100));
    }

    print('Batch prefetch completed: $successful successful, $failed failed');
  }

  // BookmarkSummaryからBookmarkInfoに変換
  BookmarkInfo _convertToBookmarkInfo(BookmarkSummary summary) {
    return BookmarkInfo(
      id: summary.id,
      title: summary.title,
      url: summary.url,
      description: summary.description,
      created: summary.created,
      updated: summary.updated,
      labels: summary.labels,
      isMarked: summary.isMarked,
    );
  }

  // 保留中のアクションを同期
  Future<void> syncPendingActions() async {
    if (!isOnline || _apiClient == null) return;

    final pendingActions = await DatabaseService.getPendingActions();

    for (final action in pendingActions) {
      try {
        final actionType = action['action_type'] as String;
        final data = Map<String, dynamic>.from(
          jsonDecode(action['data'] as String),
        );

        switch (actionType) {
          case 'create_bookmark':
            final bookmarkCreate = BookmarkCreate(
              url: data['url'] as String,
              title: data['title'] as String?,
            );
            await _apiClient.createBookmark(bookmarkCreate);
            break;
          case 'delete_bookmark':
            await _apiClient.deleteBookmark(data['id'] as String);
            break;
          // 他のアクションタイプもここに追加
        }

        // 成功したら保留アクションを削除
        await DatabaseService.deletePendingAction(action['id'] as int);
      } catch (e) {
        // エラーが発生した場合はログに記録するが、他のアクションは続行
        print('Failed to sync action: ${action['action_type']}, error: $e');
      }
    }
  }

  // 自動同期（アプリがオンラインになった時に呼ばれる）
  Future<void> autoSync() async {
    final isConnected = await checkConnectivity();
    final isOfflineMode = _ref.read(isOfflineProvider);

    if (!isOfflineMode && isConnected && _apiClient != null) {
      try {
        await syncPendingActions();
        print('Auto sync completed successfully');
      } catch (e) {
        print('Auto sync failed: $e');
      }
    }
  }

  // 接続状態が変わった時の処理
  void onConnectivityChanged(ConnectivityResult result) {
    if (result != ConnectivityResult.none) {
      // オンラインになったら自動同期を実行
      Future.delayed(const Duration(seconds: 1), () {
        autoSync();
      });
    }
  }
}

// オフライン対応APIサービスのプロバイダー
final offlineAwareApiServiceProvider = Provider<OfflineAwareApiService?>((ref) {
  // globalApiClientが利用可能な場合のみサービスを作成
  return OfflineAwareApiService(null, ref); // globalApiClientは別途設定
});
