# Readeck 関連アプリ

このリポジトリは Readeck 関連の Flutter アプリケーション群を管理しています。

## ディレクトリ構成

- `readeck_client/` : Dart 製の API クライアントライブラリ
- `readeck_mobile/` : Flutter 製のモバイルアプリ（iOS/Android 対応）

---

# 詳細仕様

## 機能一覧

- ブックマークの一覧表示・詳細表示・追加・編集・削除
- ラベル・コレクションによる分類
- 高度検索（キーワード・ラベル・コレクション・日付などで絞り込み）
- 設定画面（テーマ切替、アカウント、データ管理など）
- 共有機能（他アプリからのテキスト/URL 受信、共有）
- オフライン対応（ローカルキャッシュ）
- iOS/Android 両対応
- 画面遷移は GoRouter で統一、戻る操作やスワイプも安全

## 技術スタック

- Flutter 3.x
- Riverpod（状態管理）
- GoRouter（画面遷移）
- Freezed/JsonSerializable（モデル）
- SQLite/SharedPreferences（ローカル保存）
- REST API 連携（readeck_client）

## 画面構成

- ホーム
- ブックマーク一覧・詳細
- ラベル一覧
- コレクション一覧
- 高度検索
- 設定
- ログイン

## 開発・ビルド方法

1. Flutter のセットアップ ([公式サイト](https://flutter.dev/))
2. 依存パッケージのインストール

```bash
cd readeck_mobile
flutter pub get
```

3. 実行

```bash
flutter run
```

## ライセンス

MIT License

---
ご質問・要望は Issue または PR でお願いします。
