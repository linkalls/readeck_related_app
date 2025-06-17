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
  final serverUrl = prefs.getString('serverUrl') ?? '';
  final token = prefs.getString('token');
  if (serverUrl.isEmpty || token == null) {
    throw Exception('Not logged in');
  }
  globalApiClient = ReadeckApiClient(baseUrl: serverUrl, token: token);
  return globalApiClient!;
}
