# Readeck Related App

このリポジトリは Readeck 関連の Flutter アプリケーション群を管理しています。

## ディレクトリ構成

- `readeck_client/` : Dart 製の API クライアントライブラリ
- `readeck_mobile/` : Flutter 製のモバイルアプリ（iOS/Android 対応）

---

# 詳細仕様（日本語）

## readeck_mobile

### 機能一覧

- ブックマークの一覧表示・詳細表示・追加・編集・削除
- ラベル・コレクションによる分類
- 高度検索（キーワード・ラベル・コレクション・日付などで絞り込み）
- 設定画面（テーマ切替、アカウント、データ管理など）
- 共有機能（他アプリからのテキスト/URL 受信、共有）
- オフライン対応（ローカルキャッシュ）
- iOS/Android 両対応
- 画面遷移は GoRouter で統一、戻る操作やスワイプも安全

### 技術スタック

- Flutter 3.x
- Riverpod（状態管理）
- GoRouter（画面遷移）
- Freezed/JsonSerializable（モデル）
- SQLite/SharedPreferences（ローカル保存）
- REST API 連携（readeck_client）

### 画面構成

- ホーム
- ブックマーク一覧・詳細
- ラベル一覧
- コレクション一覧
- 高度検索
- 設定
- ログイン

### 画面遷移例

- ホーム → 設定: スタックに積まれ、スワイプや戻るで安全に戻れる
- 詳細画面 → 戻る: context.pop() で GoRouter 経由
- 高度検索: context.push('/advanced_search') で遷移

---

# Specification (English)

## readeck_mobile

### Features

- List, view, add, edit, and delete bookmarks
- Organize by labels and collections
- Advanced search (filter by keyword, label, collection, date, etc.)
- Settings screen (theme, account, data management, etc.)
- Sharing (receive text/URL from other apps, share bookmarks)
- Offline support (local cache)
- Supports both iOS and Android
- Unified navigation with GoRouter, safe back/swipe gestures

### Tech Stack

- Flutter 3.x
- Riverpod (state management)
- GoRouter (navigation)
- Freezed/JsonSerializable (models)
- SQLite/SharedPreferences (local storage)
- REST API integration (readeck_client)

### Main Screens

- Home
- Bookmarks (list/detail)
- Labels
- Collections
- Advanced Search
- Settings
- Login

### Navigation Example

- Home → Settings: Stacked navigation, safe to return via swipe or back
- Detail → Back: Uses context.pop() via GoRouter
- Advanced Search: Navigated with context.push('/advanced_search')

---

## 開発・ビルド方法 / How to build

1. Flutter のセットアップ / Set up Flutter ([official site](https://flutter.dev/))
2. 依存パッケージのインストール / Install dependencies

```bash
cd readeck_mobile
flutter pub get
```

3. 実行 / Run

```bash
flutter run
```

## ライセンス / License

MIT License

---

ご質問・要望は Issue または PR でお願いします。
For questions or requests, please use Issues or PRs.
