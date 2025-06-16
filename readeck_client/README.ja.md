# Readeck API クライアント (Dart)

[Readeck API](https://github.com/readeck/readeck) と連携するためのDartクライアントライブラリです。このクライアントは、Freezedによるデータモデルと`http`パッケージによる通信を利用し、様々なAPIエンドポイントへ型安全にアクセスするメソッドを提供します。
```bash
dart run build_runner build --delete-conflicting-outputs
```
## 特徴

*   **型安全なAPI呼び出し:** Freezedを使用して生成されたデータモデルにより、型安全性が保証され、実行時エラーを削減します。
*   **認証:** 認証トークンの設定とクリアが容易に行えます。`login`メソッドは成功時に自動でトークンを保存します。
*   **実装済みエンドポイント:**
    *   認証 (`/auth`, `/profile`)
    *   ブックマーク (CRUD、一覧、同期、記事エクスポート、共有)
    *   ラベル (CRUD、一覧)
    *   アノテーション (ハイライト) (CRUD、一覧)
    *   コレクション (CRUD、一覧)
    *   インポート (テキスト、Wallabag、ブラウザHTML、Pocket HTML)
    *   Cookbook/開発ツール (`/cookbook/extract`)
*   **エラーハンドリング:** APIのエラータイプに応じたカスタム例外を提供します。
*   **Multipartファイルアップロード:** `multipart/form-data` によるファイルインポートをサポートします。
*   **非JSONレスポンス対応:** 特定のエンドポイント（記事本文、EPUBエクスポート、Cookbook抽出HTMLなど）におけるHTMLやバイナリレスポンスをサポートします。

## はじめに

### 必要条件

*   Dart SDK がインストールされていること。
*   Readeck のインスタンスが実行されていること。

### インストール

`pubspec.yaml` ファイルに以下を追加してください：

```yaml
dependencies:
  http: ^1.0.0 # または互換性のあるバージョン
  freezed_annotation: any # 適切なバージョンを使用
  json_annotation: any # 適切なバージョンを使用
  http_parser: ^0.8.0 # multipartリクエストでMediaTypeを直接構築する場合に推奨

  # このクライアントをローカルパスから使用する場合:
  # readeck_api_client:
  #   path: path/to/readeck_client

  # pub.devに公開された場合:
  # readeck_api_client: ^0.1.0
dev_dependencies:
  build_runner: any
  freezed: any
  json_serializable: any
```

その後、`dart pub get` または `flutter pub get` を実行してください。

### 基本的な使い方

```dart
import 'dart:io'; // File操作のため (ディスクから読み込む場合)
import 'dart:typed_data'; // Uint8Listのため
import 'package:readeck_client/readeck_api_client.dart';
import 'package:readeck_client/models.dart';
// import 'package:http_parser/http_parser.dart'; // MediaTypeを直接使う場合に必要

void main() async {
  final apiClient = ReadeckApiClient(baseUrl: 'あなたのREADECK_BASE_URL');

  try {
    final authRequest = AuthRequest(
      username: 'your_username',
      password: 'your_password',
      application: 'MyDartApp',
    );
    // loginメソッドは自動的にクライアントにトークンをセットします
    final authResponse = await apiClient.login(authRequest);
    print('ログイン成功! トークン: ${authResponse.token}');

    // ... 他の例 ...

    // extractLink の例 (管理者のみ)
    // try {
    //   // ユーザーが認証済みで管理者権限を持っていると仮定
    //   final dynamic extractionResultJson = await apiClient.extractLink('https://example.com/article');
    //   if (extractionResultJson is ExtractionResult) {
    //      print('抽出タイトル (JSON): ${extractionResultJson.title}');
    //   }
    //
    //   final dynamic extractionResultHtml = await apiClient.extractLink('https://example.com/article', acceptType: 'text/html');
    //   if (extractionResultHtml is String) {
    //      print('抽出HTML長: ${extractionResultHtml.length}');
    //   }
    // } on ApiException catch (e) {
    //   print('リンク抽出失敗: ${e.message}');
    // }

  } on UnauthorizedException catch (e) {
    print('認証に失敗しました: ${e.message}');
  } on ValidationException catch (e) {
    print('バリデーションエラー: ${e.message}');
    e.errors?.forEach((field, errors) {
      print('  $field: ${errors.join(', ')}');
    });
  } on ApiException catch (e) {
    print('APIエラーが発生しました: ${e.message}');
  } catch (e) {
    print('予期せぬエラーが発生しました: $e');
  } finally {
    apiClient.dispose();
  }
}
```

## 実装済みエンドポイント

現在までに、以下のカテゴリのエンドポイントが実装されています：

*   **認証:**
    *   `POST /auth`: ログインし、APIトークンを取得します。トークンはクライアントに自動設定されます。
    *   `GET /profile`: 現在のユーザープロファイルを取得します。
*   **ブックマーク:**
    *   `GET /bookmarks`: フィルタリングとページネーション付きでブックマーク一覧を取得します。
    *   `GET /bookmarks/sync`: 同期のためにすべてのブックマークを一覧表示します。
    *   `POST /bookmarks`: 新しいブックマークを作成します。
    *   `GET /bookmarks/{id}`: 特定のブックマークの詳細を取得します。
    *   `PATCH /bookmarks/{id}`: ブックマークを更新します。
    *   `DELETE /bookmarks/{id}`: ブックマークを削除します。
    *   `GET /bookmarks/{id}/article`: 処理された記事のコンテンツ（HTML）を取得します。
    *   `GET /bookmarks/{id}/article.{format}`: ブックマークをエクスポートします（例: EPUB、Markdown）。
    *   `GET /bookmarks/{id}/share/link`: 公開共有可能なリンクを作成します。
    *   `POST /bookmarks/{id}/share/email`: ブックマークをメールで共有します。
*   **ラベル:**
    *   `GET /bookmarks/labels`: すべてのラベルを一覧表示します。
    *   `GET /bookmarks/labels/{name}`: 特定のラベルに関する情報を取得します。
    *   `PATCH /bookmarks/labels/{name}`: ラベル名を更新します。
    *   `DELETE /bookmarks/labels/{name}`: ラベルを削除します。
*   **アノテーション (ハイライト):**
    *   `GET /bookmarks/annotations`: 現在のユーザーのすべてのアノテーションを一覧表示します。
    *   `GET /bookmarks/{bookmarkId}/annotations`: 特定のブックマークのアノテーションを一覧表示します。
    *   `POST /bookmarks/{bookmarkId}/annotations`: アノテーションを作成します。
    *   `PATCH /bookmarks/{bookmarkId}/annotations/{annotationId}`: アノテーションを更新します。
    *   `DELETE /bookmarks/{bookmarkId}/annotations/{annotationId}`: アノテーションを削除します。
*   **コレクション:**
    *   `GET /bookmarks/collections`: すべてのコレクションを一覧表示します。
    *   `POST /bookmarks/collections`: 新しいコレクションを作成します。
    *   `GET /bookmarks/collections/{id}`: 特定のコレクションの詳細を取得します。
    *   `PATCH /bookmarks/collections/{id}`: コレクションを更新します。
    *   `DELETE /bookmarks/collections/{id}`: コレクションを削除します。
*   **インポート:**
    *   `POST /bookmarks/import/text`: プレーンテキストファイルの内容からブックマークをインポートします。
    *   `POST /bookmarks/import/wallabag`: Wallabagインスタンスからブックマークをインポートします。
    *   `POST /bookmarks/import/browser`: ブラウザブックマーク（HTMLファイル、multipart/form-data経由）をインポートします。
    *   `POST /bookmarks/import/pocket-file`: Pocketエクスポート（HTMLファイル、multipart/form-data経由）をインポートします。
*   **Cookbook (開発ツール - 管理者のみ):**
    *   `GET /cookbook/extract`: URLからコンテンツとメタデータを抽出します。JSON ([ExtractionResult]) またはHTML ([String]) を返します。

## 今後の作業

*   残りのAPIエンドポイントの実装（もしあれば）。
*   包括的なユニットテストと統合テストの追加。
*   pub.devへの公開。
*   さらなるAPIテストに基づくエラーハンドリングとモデル詳細の改良。

## 貢献

貢献を歓迎します！Issueを開いたり、プルリクエストを送信したりしてください。

---

*このクライアントは現在開発中です。*
