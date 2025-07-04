import 'package:flutter/material.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class LabelBookmarksScreen extends StatelessWidget {
  final String label;
  const LabelBookmarksScreen({required this.label, super.key});

  Future<List<BookmarkSummary>> _fetchBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final serverUrl = prefs.getString('serverUrl') ?? '';
    final token = prefs.getString('token');
    if (serverUrl.isEmpty || token == null) throw Exception('Not logged in');
    final api = ReadeckApiClient(baseUrl: serverUrl, token: token);
    return api.listBookmarks(labels: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks for "$label"')),
      body: FutureBuilder<List<BookmarkSummary>>(
        future: _fetchBookmarks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error:  ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No bookmarks found.'));
          }
          final bookmarks = snapshot.data!;
          return ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final b = bookmarks[index];
              return ListTile(
                title: Text(b.title ?? 'No Title'),
                subtitle: Text(b.url ?? ''),
                leading: const Icon(Icons.bookmark_rounded),
                onTap: () {
                  // 記事詳細画面へ遷移（GoRouter推奨）
                  context.push('/bookmark/${b.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}
