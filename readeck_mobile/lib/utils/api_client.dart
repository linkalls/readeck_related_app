import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

// グローバルAPIクライアント
ReadeckApiClient? globalApiClient;

void setGlobalApiClient(String serverUrl, String token) {
  globalApiClient = ReadeckApiClient(baseUrl: serverUrl, token: token);
}

void clearGlobalApiClient() {
  globalApiClient = null;
}

Future<ReadeckApiClient> getApiClient() async {
  if (globalApiClient != null) {
    return globalApiClient!;
  }

  final prefs = await SharedPreferences.getInstance();
  final serverUrl = prefs.getString('serverUrl');
  final token = prefs.getString('token');

  if (serverUrl == null || serverUrl.isEmpty) {
    throw Exception('サーバーURLが設定されていません。アプリでサーバー設定を行ってください。');
  }

  if (token == null || token.isEmpty) {
    throw Exception('認証トークンがありません。アプリでログインしてください。');
  }

  try {
    globalApiClient = ReadeckApiClient(baseUrl: serverUrl, token: token);
    return globalApiClient!;
  } catch (e) {
    throw Exception('APIクライアントの初期化に失敗しました: $e');
  }
}
