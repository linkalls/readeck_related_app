import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// 検索履歴管理
final searchHistoryProvider =
    StateNotifierProvider<SearchHistoryNotifier, List<String>>((ref) {
      return SearchHistoryNotifier();
    });
