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
- Share intent: shows loading animation immediately, auto-saves, and auto-closes after saving
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
- loading_animation_widget (loading animation)
- receive_sharing_intent (share intent handling)

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

### How to test share intent

1. On Android, use another app (e.g. Chrome, Twitter) to share a URL or text to "Readeck"
2. The loading animation will appear immediately, and after saving, the app will auto-close
3. If saving fails, an error will be shown

---

## Share Intent Behavior

- When launched via share intent, the app immediately shows a loading animation (four rotating dots)
- After the animation appears, the bookmark save process starts
- When saving completes, the app auto-closes and returns to the previous app
- If saving fails, an error is displayed

## UI/UX Improvements

- Android splash screen uses a white background to avoid black screens
- Loading animation always appears before any save processing, minimizing UI freezes
- Save process is split/delayed to avoid blocking the UI thread
- Logout and error feedback is immediate

## License

MIT License

---

For questions or requests, please use Issues or PRs.
