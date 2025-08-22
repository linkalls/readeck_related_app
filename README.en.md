# Readeck Mobile App

This repository manages the Flutter application for Readeck.

## Directory Structure

- `readeck_client/`: API client library for Dart.
- `readeck_mobile/`: Flutter mobile app (iOS/Android).

---

# Specification

## Features

- List, view, add, edit, and delete bookmarks
- Organize by labels and collections
- Advanced search (filter by keyword, label, collection, date, etc.)
- Settings screen (theme, account, data management, etc.)
- Sharing (receive text/URL from other apps, share bookmarks)
- Offline support (local cache)
- Supports both iOS and Android
- Unified navigation with GoRouter, safe back/swipe gestures

## Tech Stack

- Flutter 3.x
- Riverpod (state management)
- GoRouter (navigation)
- Freezed/JsonSerializable (models)
- SQLite/SharedPreferences (local storage)
- REST API integration (readeck_client)

## Main Screens

- Home
- Bookmarks (list/detail)
- Labels
- Collections
- Advanced Search
- Settings
- Login

## How to build

1. Set up Flutter ([official site](https://flutter.dev/))
2. Install dependencies

```bash
cd readeck_mobile
flutter pub get
```

3. Run

```bash
flutter run
```

## License

MIT License

---
For questions or requests, please use Issues or PRs.
