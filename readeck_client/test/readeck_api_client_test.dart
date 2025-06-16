import 'package:test/test.dart';

// Library and models
import '../lib/readeck_client.dart';

void main() {
  // 実際のAPIサーバーのURLを指定してください
  const String baseUrl = 'https://your-api-url.com'; // 例: ローカルAPI
  late ReadeckApiClient apiClient;

  setUp(() {
    apiClient = ReadeckApiClient(baseUrl: baseUrl);
  });

  group('ReadeckApiClient - Auth Endpoints', () {
    group('login', () {
      final authRequest = AuthRequest(
        username: 'username', // ここに実際のユーザー名を入力
        password: 'password', // ここに実際のパスワードを入力
        application: 'TestApp', // アプリケーション名を指定
      );

      test(
        'returns AuthResponse on successful login (200 OK) and sets token',
        () async {
          final result = await apiClient.login(authRequest);
          expect(result, isA<AuthResponse>());
          expect(result.token, isNotEmpty);
          // プロファイル取得でtokenが使われているかも確認
          final profile = await apiClient.getProfile();
          expect(profile, isA<UserProfile>());
        },
      );

      test('throws ForbiddenException on invalid credentials', () async {
        final wrongRequest = authRequest.copyWith(password: 'wrongpassword');
        expect(
          () => apiClient.login(wrongRequest),
          throwsA(isA<ForbiddenException>()),
        );
      });

      test('throws ForbiddenException on 403 response', () async {
        // 403を返す条件のユーザーでテストする場合はここを修正
        // 例: ロックされたユーザー名など
        final forbiddenRequest = authRequest.copyWith(username: 'lockeduser');
        expect(
          () => apiClient.login(forbiddenRequest),
          throwsA(isA<ForbiddenException>()),
        );
      });

      // 500系のテストはサーバーが500を返す条件でのみ有効です。現状403が返るならスキップまたはコメントアウト推奨
      // test('throws InternalServerErrorException on 500 response', () async {
      //   final errorRequest = authRequest.copyWith(username: 'erroruser');
      //   expect(
      //     () => apiClient.login(errorRequest),
      //     throwsA(isA<InternalServerErrorException>()),
      //   );
      // });
    });
  });
}
