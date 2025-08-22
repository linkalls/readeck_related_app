import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';

import '../utils/api_client.dart';
import 'offline_cache_provider.dart';

enum BookmarkFilter { all, unread, reading, read }

enum BookmarkSort { dateAddedDesc, dateAddedAsc, titleAsc, titleDesc }

// ブックマーク一覧の状態管理
class BookmarkListState {
  final List<BookmarkSummary> bookmarks;
  final String query;
  final int offset;
  final bool hasMore;
  final bool isLoading;
  final BookmarkFilter filter;
  final BookmarkSort sort;

  const BookmarkListState({
    this.bookmarks = const [],
    this.query = '',
    this.offset = 0,
    this.hasMore = true,
    this.isLoading = false,
    this.filter = BookmarkFilter.all,
    this.sort = BookmarkSort.dateAddedDesc,
  });

  BookmarkListState copyWith({
    List<BookmarkSummary>? bookmarks,
    String? query,
    int? offset,
    bool? hasMore,
    bool? isLoading,
    BookmarkFilter? filter,
    BookmarkSort? sort,
  }) {
    return BookmarkListState(
      bookmarks: bookmarks ?? this.bookmarks,
      query: query ?? this.query,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
      sort: sort ?? this.sort,
    );
  }
}

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

      List<String>? readStatus;
      if (state.filter != BookmarkFilter.all) {
        readStatus = [state.filter.name];
      }

      // TODO: Add sorting to API call when available
      // final sortString = state.sort.name; // e.g. 'dateAddedDesc' -> '-date_added'

      final newBookmarks = await api.listBookmarks(
        limit: pageSize,
        offset: state.offset,
        search: state.query.isNotEmpty ? state.query : null,
        readStatus: readStatus,
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

  void changeFilter(BookmarkFilter newFilter) {
    state = state.copyWith(filter: newFilter);
    loadBookmarks(reset: true);
  }

  void changeSort(BookmarkSort newSort) {
    state = state.copyWith(sort: newSort);
    loadBookmarks(reset: true);
  }
}

// プロバイダ定義
final bookmarkListProvider =
    StateNotifierProvider<BookmarkListNotifier, BookmarkListState>((ref) {
      return BookmarkListNotifier();
    });

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
