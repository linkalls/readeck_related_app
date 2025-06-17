import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bookmark_detail_screen.dart';
import 'modern_bookmarks_screen.dart';
import 'services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // データベースの初期化
  try {
    await DatabaseService.database;
    print('Database initialized successfully');
  } catch (e) {
    print('Failed to initialize database: $e');
  }

  runApp(const ProviderScope(child: ReadeckApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    // 無効なパスの場合はホームにリダイレクト
    final validPaths = ['/', '/bookmarks', '/labels', '/collections', '/settings', '/login'];
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
  ],
);

class ReadeckApp extends ConsumerWidget {
  const ReadeckApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authTokenProvider);
    final autoLoginAsync = ref.watch(autoLoginProvider);

    return MaterialApp.router(
      title: 'Readeck Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        cardTheme: const CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      routerConfig: _router,
      builder: (context, child) {
        return autoLoginAsync.when(
          data: (isLoggedIn) {
            if (token == null && !isLoggedIn) {
              return const LoginScreen();
            }
            return child!;
          },
          loading: () => const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...'),
                ],
              ),
            ),
          ),
          error: (e, st) => const LoginScreen(),
        );
      },
    );
  }
}

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

// ブックマーク検索とページネーション用のState
class BookmarkListState {
  final List<BookmarkSummary> bookmarks;
  final String query;
  final int offset;
  final bool hasMore;
  final bool isLoading;

  const BookmarkListState({
    this.bookmarks = const [],
    this.query = '',
    this.offset = 0,
    this.hasMore = true,
    this.isLoading = false,
  });

  BookmarkListState copyWith({
    List<BookmarkSummary>? bookmarks,
    String? query,
    int? offset,
    bool? hasMore,
    bool? isLoading,
  }) {
    return BookmarkListState(
      bookmarks: bookmarks ?? this.bookmarks,
      query: query ?? this.query,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// ブックマーク一覧の状態管理
final bookmarkListProvider =
    StateNotifierProvider<BookmarkListNotifier, BookmarkListState>((ref) {
      return BookmarkListNotifier();
    });

class BookmarkListNotifier extends StateNotifier<BookmarkListState> {
  static const int pageSize = 20;

  BookmarkListNotifier() : super(const BookmarkListState());

  Future<void> loadBookmarks({bool reset = false}) async {
    if (state.isLoading) return;

    if (reset) {
      state = state.copyWith(
        bookmarks: [],
        offset: 0,
        hasMore: true,
        isLoading: true,
      );
    } else {
      state = state.copyWith(isLoading: true);
    }
    try {
      final api = await getApiClient();
      final newBookmarks = await api.listBookmarks(
        limit: pageSize,
        offset: state.offset,
        search: state.query.isNotEmpty ? state.query : null,
      );

      final allBookmarks = reset
          ? newBookmarks
          : [...state.bookmarks, ...newBookmarks];

      state = state.copyWith(
        bookmarks: allBookmarks,
        offset: state.offset + newBookmarks.length,
        hasMore: newBookmarks.length == pageSize,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> search(String query) async {
    state = state.copyWith(query: query);
    await loadBookmarks(reset: true);
  }

  Future<void> loadMore() async {
    if (state.hasMore && !state.isLoading) {
      await loadBookmarks();
    }
  }

  void clearSearch() {
    state = state.copyWith(query: '');
    loadBookmarks(reset: true);
  }
}

// オフライン用キャッシュProvider
final offlineCacheProvider =
    StateNotifierProvider<OfflineCacheNotifier, Map<String, dynamic>>((ref) {
      return OfflineCacheNotifier();
    });

class OfflineCacheNotifier extends StateNotifier<Map<String, dynamic>> {
  OfflineCacheNotifier() : super({});
  Future<void> cacheBookmarks(List<BookmarkSummary> bookmarks) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarksJson = bookmarks
        .map(
          (b) => {
            'id': b.id,
            'title': b.title,
            'url': b.url,
            'siteName': b.siteName,
            'description': b.description,
            'labels': b.labels,
            'created': b.created?.toIso8601String(),
          },
        )
        .toList();

    await prefs.setString('cached_bookmarks', jsonEncode(bookmarksJson));
    state = {...state, 'bookmarks': bookmarks};
  }

  Future<List<BookmarkSummary>> getCachedBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('cached_bookmarks');

    if (cachedData != null) {
      final List<dynamic> bookmarksJson = jsonDecode(cachedData);
      return bookmarksJson
          .map(
            (json) => BookmarkSummary(
              id: json['id'],
              title: json['title'],
              url: json['url'],
              siteName: json['siteName'],
              description: json['description'],
              labels: json['labels']?.cast<String>(),
              created: json['created'] != null
                  ? DateTime.parse(json['created'])
                  : null,
            ),
          )
          .toList();
    }
    return [];
  }

  Future<void> cacheBookmarkContent(String id, String content) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cached_content_$id', content);
  }

  Future<String?> getCachedBookmarkContent(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cached_content_$id');
  }
}

final bookmarksProvider = FutureProvider.autoDispose<List<BookmarkSummary>>((
  ref,
) async {
  try {
    final api = await getApiClient();
    final bookmarks = await api.listBookmarks(limit: 20);

    // オンラインデータをキャッシュ
    final offlineCache = ref.read(offlineCacheProvider.notifier);
    await offlineCache.cacheBookmarks(bookmarks);

    return bookmarks;
  } catch (e) {
    // API エラー時はキャッシュからデータを取得
    final offlineCache = ref.read(offlineCacheProvider.notifier);
    final cachedBookmarks = await offlineCache.getCachedBookmarks();

    if (cachedBookmarks.isNotEmpty) {
      return cachedBookmarks;
    }

    // キャッシュも空の場合はエラーを再スロー
    rethrow;
  }
});

final labelsProvider = FutureProvider.autoDispose<List<LabelInfo>>((ref) async {
  final api = await getApiClient();
  return api.listLabels();
});

final loginStateProvider = StateProvider<LoginState>(
  (ref) => LoginState.initial(),
);

class LoginState {
  final bool isLoading;
  final String? error;
  LoginState({this.isLoading = false, this.error});
  factory LoginState.initial() => LoginState();
  LoginState copyWith({bool? isLoading, String? error}) {
    return LoginState(isLoading: isLoading ?? this.isLoading, error: error);
  }
}

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

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(bookmarksProvider);
    final theme = Theme.of(context);

    // リフレッシュ関数
    Future<void> refreshBookmarks() async {
      try {
        ref.invalidate(bookmarksProvider);
        await ref.read(bookmarksProvider.future);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('更新に失敗しました: $e'),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        }
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primaryContainer.withOpacity(0.3),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.bookmark_rounded,
                        color: theme.colorScheme.onPrimary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Readeck',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your bookmarks collection',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () => context.go('/settings'),
                      icon: const Icon(Icons.settings_rounded),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: NavCard(
                        icon: Icons.bookmark_rounded,
                        title: 'Bookmarks',
                        onTap: () => context.go('/bookmarks'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: NavCard(
                        icon: Icons.search_rounded,
                        title: 'Search',
                        onTap: () {
                          // 検索ダイアログを表示
                          _showQuickSearchDialog(context, ref);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: NavCard(
                        icon: Icons.label_rounded,
                        title: 'Labels',
                        onTap: () => context.go('/labels'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: NavCard(
                        icon: Icons.collections_bookmark_rounded,
                        title: 'Collections',
                        onTap: () => context.go('/collections'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: refreshBookmarks,
                  color: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surface,
                  strokeWidth: 2.0,
                  displacement: 40.0,
                  child: bookmarksAsync.when(
                    data: (bookmarks) => CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Recent Bookmarks',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),
                        bookmarks.isEmpty
                            ? SliverFillRemaining(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border_rounded,
                                        size: 64,
                                        color: theme.colorScheme.onSurface
                                            .withOpacity(0.5),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'No bookmarks yet',
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withOpacity(0.7),
                                            ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Pull down to refresh',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withOpacity(0.5),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SliverList(
                                delegate: SliverChildBuilderDelegate((
                                  context,
                                  index,
                                ) {
                                  final bookmark = bookmarks[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: BookmarkCard(bookmark: bookmark),
                                  );
                                }, childCount: bookmarks.length),
                              ),
                      ],
                    ),
                    loading: () => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                    error: (e, st) => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline_rounded,
                                size: 64,
                                color: theme.colorScheme.error,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Error loading bookmarks',
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Text(
                                  e.toString(),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () =>
                                    ref.invalidate(bookmarksProvider),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // クイック検索ダイアログ
  void _showQuickSearchDialog(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.search_rounded),
            SizedBox(width: 8),
            Text('Quick Search'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search bookmarks...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search_rounded),
              ),
              autofocus: true,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  // 検索を実行してブックマーク画面に遷移
                  ref.read(bookmarkListProvider.notifier).search(value.trim());
                  ref
                      .read(searchHistoryProvider.notifier)
                      .addSearch(value.trim());
                  Navigator.pop(context);
                  context.go('/bookmarks');
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdvancedSearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.tune_rounded),
                  label: const Text('Advanced'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    final query = searchController.text.trim();
                    if (query.isNotEmpty) {
                      ref.read(bookmarkListProvider.notifier).search(query);
                      ref.read(searchHistoryProvider.notifier).addSearch(query);
                      Navigator.pop(context);
                      context.go('/bookmarks');
                    }
                  },
                  icon: const Icon(Icons.search_rounded),
                  label: const Text('Search'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const NavCard({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 32, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                title,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkCard extends ConsumerWidget {
  final BookmarkSummary bookmark;

  const BookmarkCard({required this.bookmark, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final offlineCache = ref.read(offlineCacheProvider.notifier);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // ブックマーク詳細画面に遷移
          context.push('/bookmark/${bookmark.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getBookmarkIcon(bookmark.type),
                      size: 20,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookmark.title ?? 'No Title',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (bookmark.siteName != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.language_rounded,
                                size: 14,
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.6,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  bookmark.siteName!,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withOpacity(0.7),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ), // アクションボタン
                  Column(
                    children: [
                      // オフラインダウンロードボタン
                      FutureBuilder<String?>(
                        future: offlineCache.getCachedBookmarkContent(
                          bookmark.id ?? '',
                        ),
                        builder: (context, snapshot) {
                          final isCached =
                              snapshot.hasData && snapshot.data != null;

                          return IconButton(
                            onPressed: () async {
                              if (isCached) {
                                // キャッシュを削除
                                await _removeCachedContent(
                                  context,
                                  ref,
                                  bookmark.id ?? '',
                                );
                              } else {
                                // コンテンツをダウンロード
                                await _downloadForOffline(
                                  context,
                                  ref,
                                  bookmark,
                                );
                              }
                            },
                            icon: Icon(
                              isCached
                                  ? Icons.offline_bolt_rounded
                                  : Icons.download_rounded,
                              color: isCached
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurface.withOpacity(
                                      0.6,
                                    ),
                              size: 20,
                            ),
                            tooltip: isCached
                                ? 'Remove offline content'
                                : 'Download for offline',
                          );
                        },
                      ),
                      // オフライン状態表示
                      FutureBuilder<String?>(
                        future: offlineCache.getCachedBookmarkContent(
                          bookmark.id ?? '',
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Offline',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 10,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ],
              ),
              if (bookmark.description != null &&
                  bookmark.description!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  bookmark.description!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.8),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (bookmark.labels != null && bookmark.labels!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: bookmark.labels!
                      .take(3)
                      .map(
                        (label) => LabelChip(
                          label: label,
                          onTap: () {
                            // ラベルで検索
                            ref
                                .read(bookmarkListProvider.notifier)
                                .search(label);
                            context.go('/bookmarks');
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
              if (bookmark.created != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 14,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(bookmark.created!),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  IconData _getBookmarkIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'article':
        return Icons.article_rounded;
      case 'video':
        return Icons.play_circle_rounded;
      case 'photo':
      case 'image':
        return Icons.image_rounded;
      case 'audio':
        return Icons.audio_file_rounded;
      default:
        return Icons.bookmark_rounded;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}y ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}mo ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  // オフライン用にコンテンツをダウンロード
  Future<void> _downloadForOffline(
    BuildContext context,
    WidgetRef ref,
    BookmarkSummary bookmark,
  ) async {
    try {
      // ローディング表示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 16),
              Text('Downloading "${bookmark.title ?? 'bookmark'}"...'),
            ],
          ),
          duration: const Duration(seconds: 2),
        ),
      );

      // APIからコンテンツを取得
      final api = await getApiClient();
      final markdownContent = await api.exportBookmark(bookmark.id!, "md");

      // キャッシュに保存
      final cacheNotifier = ref.read(offlineCacheProvider.notifier);
      await cacheNotifier.cacheBookmarkContent(bookmark.id!, markdownContent);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Downloaded "${bookmark.title ?? 'bookmark'}" for offline reading',
                  ),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_rounded, color: Colors.white),
                const SizedBox(width: 16),
                Expanded(child: Text('Failed to download: $e')),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  // キャッシュされたコンテンツを削除
  Future<void> _removeCachedContent(
    BuildContext context,
    WidgetRef ref,
    String bookmarkId,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('cached_content_$bookmarkId');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.delete_rounded, color: Colors.white),
                SizedBox(width: 16),
                Text('Offline content removed'),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to remove offline content: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primaryContainer.withOpacity(0.3),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        try {
                          print('Settings: Attempting to navigate back');
                          if (Navigator.of(context).canPop()) {
                            print('Settings: Using Navigator.pop()');
                            Navigator.of(context).pop();
                          } else if (context.canPop()) {
                            print('Settings: Using context.pop()');
                            context.pop();
                          } else {
                            print('Settings: Using context.go("/")');
                            context.go('/');
                          }
                        } catch (e) {
                          print('Settings navigation error: $e');
                          try {
                            context.go('/');
                          } catch (e2) {
                            print('Settings fallback navigation error: $e2');
                          }
                        }
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Settings',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          leading: const Icon(Icons.logout_rounded),
                          title: const Text('Logout'),
                          subtitle: const Text('Sign out from your account'),
                          onTap: () {
                            // TODO: ログアウト処理
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateProvider);
    final notifier = ref.read(loginStateProvider.notifier);
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final serverUrlController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.1),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.bookmark_rounded,
                    size: 48,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Welcome to Readeck',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to access your bookmarks',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 48),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: serverUrlController,
                            decoration: const InputDecoration(
                              labelText: 'Server URL',
                              prefixIcon: Icon(Icons.dns_rounded),
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person_rounded),
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_rounded),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 24),
                          if (state.error != null) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline_rounded,
                                    color: theme.colorScheme.error,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      state.error!,
                                      style: TextStyle(
                                        color:
                                            theme.colorScheme.onErrorContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () async {
                                      if (!(formKey.currentState?.validate() ??
                                          false)) {
                                        return;
                                      }
                                      notifier.state = state.copyWith(
                                        isLoading: true,
                                        error: null,
                                      );

                                      final rawUrl = serverUrlController.text
                                          .trim();
                                      final username = usernameController.text
                                          .trim();
                                      final password = passwordController.text;

                                      var normalizedUrl = rawUrl;
                                      if (!RegExp(
                                        r'https?://',
                                      ).hasMatch(normalizedUrl)) {
                                        normalizedUrl = 'http://$normalizedUrl';
                                      }
                                      if (normalizedUrl.endsWith('/')) {
                                        normalizedUrl = normalizedUrl.substring(
                                          0,
                                          normalizedUrl.length - 1,
                                        );
                                      }

                                      try {
                                        final client = ReadeckApiClient(
                                          baseUrl: normalizedUrl,
                                        );
                                        final res = await client.login(
                                          AuthRequest(
                                            username: username,
                                            password: password,
                                            application: 'readeck_mobile',
                                          ),
                                        );
                                        if (res.token == null) {
                                          throw Exception('No token');
                                        }

                                        setGlobalApiClient(
                                          normalizedUrl,
                                          res.token!,
                                        );
                                        ref
                                            .read(authTokenProvider.notifier)
                                            .state = res
                                            .token;
                                        final prefs =
                                            await SharedPreferences.getInstance();
                                        await prefs.setString(
                                          'serverUrl',
                                          normalizedUrl,
                                        );
                                        await prefs.setString(
                                          'token',
                                          res.token!,
                                        );

                                        if (context.mounted) context.go('/');
                                      } catch (e) {
                                        notifier.state = state.copyWith(
                                          isLoading: false,
                                          error: e.toString(),
                                        );
                                        return;
                                      }
                                      notifier.state = state.copyWith(
                                        isLoading: false,
                                      );
                                    },
                              child: state.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Sign In'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookmarksScreen extends HookConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkState = ref.watch(bookmarkListProvider);
    final bookmarkNotifier = ref.read(bookmarkListProvider.notifier);
    final offlineCache = ref.read(offlineCacheProvider.notifier);
    final searchController = useTextEditingController();
    final scrollController = useScrollController();
    final theme = Theme.of(context);

    // 初回読み込み
    useEffect(() {
      if (bookmarkState.bookmarks.isEmpty && !bookmarkState.isLoading) {
        Future.microtask(() async {
          try {
            await bookmarkNotifier.loadBookmarks(reset: true);
          } catch (e) {
            // オフライン時はキャッシュから読み込み
            final cachedBookmarks = await offlineCache.getCachedBookmarks();
            if (cachedBookmarks.isNotEmpty) {
              // キャッシュがある場合は表示
            }
          }
        });
      }
      return null;
    }, []);

    // スクロール監視（無限スクロール）
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          bookmarkNotifier.loadMore();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primaryContainer.withOpacity(0.3),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ヘッダー
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton.filled(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Bookmarks',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          _showSearchDialog(context, ref, searchController),
                      icon: const Icon(Icons.search_rounded),
                    ),
                  ],
                ),
              ),
              // 検索バー（検索中のみ表示）
              if (bookmarkState.query.isNotEmpty)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Searching for: "${bookmarkState.query}"',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          IconButton(
                            onPressed: () => bookmarkNotifier.clearSearch(),
                            icon: const Icon(Icons.close_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              // ブックマーク一覧
              Expanded(
                child: _buildBookmarkList(context, ref, scrollController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookmarkList(
    BuildContext context,
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    final bookmarkState = ref.watch(bookmarkListProvider);
    final theme = Theme.of(context);

    if (bookmarkState.bookmarks.isEmpty && bookmarkState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (bookmarkState.bookmarks.isEmpty && !bookmarkState.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border_rounded,
              size: 64,
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              bookmarkState.query.isNotEmpty
                  ? 'No bookmarks found for "${bookmarkState.query}"'
                  : 'No bookmarks yet',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              bookmarkState.query.isNotEmpty
                  ? 'Try a different search term'
                  : 'Add some bookmarks to get started',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount:
          bookmarkState.bookmarks.length + (bookmarkState.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == bookmarkState.bookmarks.length) {
          // ローディングインジケーター
          return Container(
            padding: const EdgeInsets.all(16),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final bookmark = bookmarkState.bookmarks[index];
        return BookmarkCard(bookmark: bookmark);
      },
    );
  }

  void _showSearchDialog(
    BuildContext context,
    WidgetRef ref,
    TextEditingController controller,
  ) {
    final bookmarkNotifier = ref.read(bookmarkListProvider.notifier);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Bookmarks'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Search term',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search_rounded),
          ),
          autofocus: true,
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              bookmarkNotifier.search(value.trim());
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final query = controller.text.trim();
              if (query.isNotEmpty) {
                bookmarkNotifier.search(query);
                Navigator.pop(context);
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}

// ネットワーク接続状態を監視するProvider
final connectivityProvider = StateProvider<bool>((ref) => true);

// オフライン状態を管理するWidget
class ConnectivityWrapper extends ConsumerWidget {
  final Widget child;

  const ConnectivityWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(connectivityProvider);

    return Column(
      children: [
        if (!isOnline) const OfflineIndicator(),
        Expanded(child: child),
      ],
    );
  }
}

// オフライン状態表示用のWidget
class OfflineIndicator extends ConsumerWidget {
  const OfflineIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: theme.colorScheme.errorContainer,
      child: Row(
        children: [
          Icon(
            Icons.cloud_off_rounded,
            color: theme.colorScheme.onErrorContainer,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Offline mode - Showing cached content',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ラベル表示用のWidget
class LabelChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const LabelChip({required this.label, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Chip(
        label: Text(label),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

// 検索履歴管理
final searchHistoryProvider =
    StateNotifierProvider<SearchHistoryNotifier, List<String>>((ref) {
      return SearchHistoryNotifier();
    });

class SearchHistoryNotifier extends StateNotifier<List<String>> {
  static const int maxHistory = 10;

  SearchHistoryNotifier() : super([]) {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('search_history') ?? [];
    state = history;
  }

  Future<void> addSearch(String query) async {
    if (query.trim().isEmpty) return;

    final newHistory = [query];
    for (final item in state) {
      if (item != query && newHistory.length < maxHistory) {
        newHistory.add(item);
      }
    }

    state = newHistory;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', newHistory);
  }

  Future<void> clearHistory() async {
    state = [];
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
  }
}

// 高度な検索画面
class AdvancedSearchScreen extends HookConsumerWidget {
  const AdvancedSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final searchHistory = ref.watch(searchHistoryProvider);
    final queryController = useTextEditingController();
    final titleController = useTextEditingController();
    final siteController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Search'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primaryContainer.withOpacity(0.3),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search form
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search Filters',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: queryController,
                          decoration: const InputDecoration(
                            labelText: 'Search query',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search_rounded),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: 'Title contains',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.title_rounded),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: siteController,
                          decoration: const InputDecoration(
                            labelText: 'Site name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.language_rounded),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              final query = queryController.text.trim();
                              if (query.isNotEmpty) {
                                ref
                                    .read(searchHistoryProvider.notifier)
                                    .addSearch(query);
                                ref
                                    .read(bookmarkListProvider.notifier)
                                    .search(query);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Search'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Search history
                if (searchHistory.isNotEmpty) ...[
                  Text(
                    'Recent Searches',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchHistory.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final query = searchHistory[index];
                        return ListTile(
                          leading: const Icon(Icons.history_rounded),
                          title: Text(query),
                          onTap: () {
                            ref
                                .read(bookmarkListProvider.notifier)
                                .search(query);
                            Navigator.pop(context);
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () {
                              // Remove specific item (not implemented for simplicity)
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabelsScreen extends StatelessWidget {
  const LabelsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Labels Screen')));
  }
}

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Collections Screen')));
  }
}
