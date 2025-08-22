import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../utils/api_client.dart';

// 共有されたコンテンツの状態
class SharingState {
  final List<SharedMediaFile> sharedFiles;
  final String? sharedText;
  final bool isProcessing;
  final String? error;
  final Set<String> processedUrls; // 処理済みURLの追跡
  final bool isFromShareIntent; // 共有インテントから起動されたかどうか
  final bool shouldAutoClose; // 処理完了後に自動で閉じるかどうか

  const SharingState({
    this.sharedFiles = const [],
    this.sharedText,
    this.isProcessing = false,
    this.error,
    this.processedUrls = const {},
    this.isFromShareIntent = false,
    this.shouldAutoClose = false,
  });

  SharingState copyWith({
    List<SharedMediaFile>? sharedFiles,
    String? sharedText,
    bool? isProcessing,
    String? error,
    Set<String>? processedUrls,
    bool? isFromShareIntent,
    bool? shouldAutoClose,
  }) {
    return SharingState(
      sharedFiles: sharedFiles ?? this.sharedFiles,
      sharedText: sharedText ?? this.sharedText,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error ?? this.error,
      processedUrls: processedUrls ?? this.processedUrls,
      isFromShareIntent: isFromShareIntent ?? this.isFromShareIntent,
      shouldAutoClose: shouldAutoClose ?? this.shouldAutoClose,
    );
  }
}

// 共有インテント管理サービス
class SharingService extends StateNotifier<SharingState> {
  late StreamSubscription _mediaStreamSub;
  late StreamSubscription _textStreamSub;

  SharingService() : super(const SharingState()) {
    _initializeListeners();
    _checkInitialSharing();
  }

  // 初期共有テキストを処理する（main.dartから呼び出される）
  void handleInitialSharedText(String sharedText) {
    print('🚀 Handling initial shared text from external app');
    state = state.copyWith(
      isFromShareIntent: true,
      shouldAutoClose: true,
      sharedText: sharedText,
    );

    // UI をブロックしないように非同期で処理を開始
    Future.microtask(() async {
      await _processSharedText(sharedText);
    });
  }

  // 共有インテントのリスナーを初期化
  void _initializeListeners() {
    // メディアファイル共有のリスナー
    _mediaStreamSub = ReceiveSharingIntent.instance.getMediaStream().listen(
      (files) {
        if (files.isNotEmpty) {
          state = state.copyWith(sharedFiles: files, error: null);
          _processSharedFiles(files);
        }
      },
      onError: (error) {
        state = state.copyWith(error: 'Media sharing error: $error');
        print('Media sharing error: $error');
      },
    );

    // 空のStreamSubscriptionを作成（テキストは初期共有でのみ処理）
    _textStreamSub = Stream<String>.empty().listen((_) {});
  }

  // アプリ起動時の初期共有コンテンツをチェック
  Future<void> _checkInitialSharing() async {
    try {
      // 初期メディアファイル（テキストも含む）をチェック
      final initialMedia = await ReceiveSharingIntent.instance
          .getInitialMedia();
      if (initialMedia.isNotEmpty) {
        state = state.copyWith(sharedFiles: initialMedia);
        await _processSharedFiles(initialMedia);
      }

      // 処理完了後にリセット
      ReceiveSharingIntent.instance.reset();
    } catch (error) {
      state = state.copyWith(error: 'Initial sharing check error: $error');
      print('Initial sharing check error: $error');
    }
  }

  // 共有されたファイルを処理
  Future<void> _processSharedFiles(List<SharedMediaFile> files) async {
    print('Processing shared files: ${files.length}');
    for (final file in files) {
      print('Shared file: ${file.path}, type: ${file.type}');

      // テキストタイプの場合、URLかどうかチェックして処理
      if (file.type == SharedMediaType.text && file.path.isNotEmpty) {
        await _processSharedText(file.path);
      } else if (file.type == SharedMediaType.file) {
        // 必要に応じて他のファイルタイプを処理
        print('Received file: ${file.path}');
      }
    }
  }

  // 共有されたテキスト/URLを処理
  Future<void> _processSharedText(String text) async {
    if (text.trim().isEmpty) return;

    print(
      '📎 Processing shared text: ${text.substring(0, text.length > 100 ? 100 : text.length)}...',
    );

    // テキストからURLを抽出（複数のURLが含まれている可能性もある）
    final urls = _extractUrlsFromText(text);

    if (urls.isNotEmpty) {
      // 複数のURLがある場合は最初のURLを使用
      final primaryUrl = urls.first;

      // 重複処理チェック
      if (state.processedUrls.contains(primaryUrl)) {
        print('⚠️ URL already processed: $primaryUrl');
        return;
      }

      print('🔗 Extracted URL: $primaryUrl');

      // 処理済みURLに追加
      state = state.copyWith(
        processedUrls: {...state.processedUrls, primaryUrl},
      );

      // URLのみを送信し、タイトル処理はバックエンドに任せる
      await _createBookmarkFromUrl(primaryUrl);
    } else {
      // URLが含まれていない場合はテキスト自体を保存またはエラー
      print('⚠️ No URL found in shared text');
      state = state.copyWith(
        error: 'No valid URL found in shared content',
        isProcessing: false,
      );
    }
  }

  // テキストからURLを抽出するヘルパー関数
  List<String> _extractUrlsFromText(String text) {
    final urlRegex = RegExp(
      r'https?://[^\s]+|www\.[^\s]+',
      caseSensitive: false,
    );

    final matches = urlRegex.allMatches(text);
    final urls = <String>[];

    for (final match in matches) {
      String url = match.group(0)!;

      // www.で始まる場合はhttps://を追加
      if (url.startsWith('www.')) {
        url = 'https://$url';
      }

      // 末尾の句読点を除去
      url = url.replaceAll(RegExp(r'[.,!?;:]$'), '');

      urls.add(url);
    }

    return urls;
  }

  // URLからブックマークを作成（Pocketライクな動作）
  Future<void> _createBookmarkFromUrl(String url) async {
    try {
      state = state.copyWith(isProcessing: true, error: null);

      print('🔗 Creating bookmark for URL: $url');

      // UIをブロックしないように分割して処理
      await Future.delayed(const Duration(milliseconds: 50)); // UIに制御を戻す

      final api = await getApiClient();

      // ブックマーク作成を非同期で実行
      final bookmark = await api.createBookmark(
        BookmarkCreate(
          url: url.trim(),
          labels: ['shared'], // 共有で追加されたことを示すラベル
        ),
      );

      final title = bookmark.title?.isNotEmpty == true
          ? bookmark.title!
          : 'Untitled';
      print('✅ Bookmark created successfully: $title');
      state = state.copyWith(isProcessing: false);

      // 成功を通知（必要に応じてUIに反映）
      _notifyBookmarkCreated(bookmark);

      // 共有インテントから起動された場合は、少し待ってからアプリを閉じる
      if (state.shouldAutoClose && state.isFromShareIntent) {
        print('🚪 Auto-closing app after successful bookmark creation...');
        // 自動クローズの遅延を短縮
        await Future.delayed(const Duration(milliseconds: 800));
        _closeApp();
      }
    } catch (error) {
      print('❌ Failed to create bookmark from URL: $error');

      // より詳細なエラーメッセージを提供
      String errorMessage;
      if (error.toString().contains('401') ||
          error.toString().contains('Unauthorized')) {
        errorMessage = state.isFromShareIntent
            ? 'ログインが必要です。アプリでログインしてから再度お試しください。'
            : 'ログインが必要です。アプリでログインしてください。';
      } else if (error.toString().contains('404') ||
          error.toString().contains('Not Found')) {
        errorMessage = state.isFromShareIntent
            ? 'サーバーが見つかりません。アプリの設定を確認してください。'
            : 'サーバーが見つかりません。設定を確認してください。';
      } else if (error.toString().contains('timeout') ||
          error.toString().contains('connection')) {
        errorMessage = 'ネットワーク接続を確認してください。';
      } else {
        errorMessage = state.isFromShareIntent
            ? 'ブックマークの保存に失敗しました: ${error.toString()}'
            : 'ブックマークの作成に失敗しました: ${error.toString()}';
      }

      state = state.copyWith(isProcessing: false, error: errorMessage);

      // エラー時は自動終了を無効にする
      if (state.isFromShareIntent) {
        state = state.copyWith(shouldAutoClose: false);
        print('❌ Auto-close disabled due to error');
      }
    }
  }

  // ブックマーク作成成功の通知
  void _notifyBookmarkCreated(BookmarkInfo bookmark) {
    // ここでSnackBarやNotificationを表示することができます
    final title = bookmark.title?.isNotEmpty == true
        ? bookmark.title!
        : 'Untitled';
    print('Bookmark "$title" created successfully!');
  }

  // アプリを閉じる
  void _closeApp() {
    try {
      SystemNavigator.pop();
      print('🚪 App closed successfully');
    } catch (e) {
      print('❌ Failed to close app: $e');
    }
  }

  // 手動でテキスト/URLを処理
  Future<void> processManualInput(String text) async {
    print('📱 Manual input received: $text');
    await _processSharedText(text);
  }

  // エラーをクリア
  void clearError() {
    state = state.copyWith(error: null);
  }

  // 共有状態をリセット
  void resetSharing() {
    state = const SharingState();
    ReceiveSharingIntent.instance.reset();
  }

  // 処理済みURLをクリア（デバッグ用）
  void clearProcessedUrls() {
    state = state.copyWith(processedUrls: {});
  }

  @override
  void dispose() {
    _mediaStreamSub.cancel();
    _textStreamSub.cancel();
    super.dispose();
  }
}

// プロバイダー定義
final sharingServiceProvider =
    StateNotifierProvider<SharingService, SharingState>((ref) {
      return SharingService();
    });
