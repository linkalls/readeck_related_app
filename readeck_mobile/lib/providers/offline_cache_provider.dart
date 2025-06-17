import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// オフライン用キャッシュProvider
final offlineCacheProvider =
    StateNotifierProvider<OfflineCacheNotifier, Map<String, dynamic>>((ref) {
      return OfflineCacheNotifier();
    });
