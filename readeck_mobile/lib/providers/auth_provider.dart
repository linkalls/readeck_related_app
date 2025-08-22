import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api_client.dart';

// ログイン状態
class LoginState {
  final bool isLoading;
  final String? error;

  LoginState({this.isLoading = false, this.error});

  factory LoginState.initial() => LoginState();

  LoginState copyWith({bool? isLoading, String? error}) {
    return LoginState(isLoading: isLoading ?? this.isLoading, error: error);
  }
}

// 認証関連プロバイダ
final loginStateProvider = StateProvider<LoginState>(
  (ref) => LoginState.initial(),
);

final authTokenProvider = StateProvider<String?>((ref) => null);

final autoLoginProvider = FutureProvider<bool>((ref) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final serverUrl = prefs.getString('serverUrl');
    final token = prefs.getString('token');

    if (serverUrl != null && token != null && serverUrl.isNotEmpty) {
      setGlobalApiClient(serverUrl, token);
      ref.read(authTokenProvider.notifier).state = token;
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
});

// 設定クリア用プロバイダー
final clearSettingsProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // 認証状態をリセット
      ref.read(authTokenProvider.notifier).state = null;
      ref.read(loginStateProvider.notifier).state = LoginState.initial();

      // グローバルAPIクライアントをクリア
      clearGlobalApiClient();
    } catch (e) {
      throw Exception('Failed to clear settings: $e');
    }
  };
});
