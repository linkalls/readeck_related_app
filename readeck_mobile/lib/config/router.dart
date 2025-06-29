import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../bookmark_detail_screen.dart';
import '../bookmarks_screen.dart';
import '../collections_screen.dart';
import '../labels_screen.dart';
import '../screens/screens.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // 無効なパスの場合はホームにリダイレクト
    final validPaths = [
      '/',
      '/bookmarks',
      '/labels',
      '/collections',
      '/settings',
      '/login',
    ];
    final path = state.fullPath ?? state.path ?? '/';

    if (path.startsWith('/bookmark/')) {
      // ブックマーク詳細のパスは有効
      return null;
    }

    if (!validPaths.contains(path) && !path.startsWith('/bookmark/')) {
      print('Invalid path detected: $path, redirecting to home');
      return '/';
    }

    return null; // リダイレクトしない
  },
  errorBuilder: (context, state) {
    print('Go Router Error: ${state.error}');
    print('URI: ${state.uri}');
    print('Path: ${state.path}');
    print('Full path: ${state.fullPath}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ナビゲーションエラー'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            try {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            } catch (e) {
              print('Navigation error: $e');
              context.go('/');
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'ナビゲーションエラーが発生しました',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Error: ${state.error?.toString() ?? "Unknown error"}'),
            const SizedBox(height: 8),
            Text('URI: ${state.uri}'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    try {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/');
                      }
                    } catch (e) {
                      print('Navigation error: $e');
                      context.go('/');
                    }
                  },
                  child: const Text('戻る'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('ホームに戻る'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'bookmarks',
          builder: (context, state) =>
              const ModernBookmarksScreen(), // ←ModernBookmarksScreenに変更
        ),
        GoRoute(
          path: 'labels',
          builder: (context, state) => const LabelsScreen(),
        ),
        GoRoute(
          path: 'collections',
          builder: (context, state) => const CollectionsScreen(),
        ),
        GoRoute(
          path: 'bookmark/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return BookmarkDetailScreen(bookmarkId: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/advanced_search',
      builder: (context, state) => const AdvancedSearchScreen(),
    ),
  ],
);
