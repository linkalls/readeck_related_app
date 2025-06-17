import 'dart:async';

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

  const SharingState({
    this.sharedFiles = const [],
    this.sharedText,
    this.isProcessing = false,
    this.error,
  });

  SharingState copyWith({
    List<SharedMediaFile>? sharedFiles,
    String? sharedText,
    bool? isProcessing,
    String? error,
  }) {
    return SharingState(
      sharedFiles: sharedFiles ?? this.sharedFiles,
      sharedText: sharedText ?? this.sharedText,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error ?? this.error,
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
      print('🔗 Extracted URL: $primaryUrl');

      // 追加情報として残りのテキストも保存
      final remainingText = text.replaceAll(primaryUrl, '').trim();

      await _createBookmarkFromUrl(
        primaryUrl,
        description: remainingText.isNotEmpty ? remainingText : null,
      );
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
  Future<void> _createBookmarkFromUrl(String url, {String? description}) async {
    try {
      state = state.copyWith(isProcessing: true, error: null);

      final api = await getApiClient();

      // BookmarkCreateオブジェクトを使って適切にブックマークを作成
      final bookmark = await api.createBookmark(
        BookmarkCreate(
          url: url.trim(),
          title: description, // 説明をタイトルとして使用
          labels: ['shared'], // 共有で追加されたことを示すラベル
        ),
      );

      print('✅ Bookmark created successfully: ${bookmark.title ?? url}');
      state = state.copyWith(isProcessing: false);

      // 成功を通知（必要に応じてUIに反映）
      _notifyBookmarkCreated(bookmark);
    } catch (error) {
      state = state.copyWith(
        isProcessing: false,
        error: 'Failed to create bookmark: $error',
      );
      print('❌ Failed to create bookmark from URL: $error');
    }
  }

  // ブックマーク作成成功の通知
  void _notifyBookmarkCreated(BookmarkInfo bookmark) {
    // ここでSnackBarやNotificationを表示することができます
    print('Bookmark "${bookmark.title}" created successfully!');
  }

  // 手動でテキスト/URLを処理
  Future<void> processManualInput(String text) async {
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
