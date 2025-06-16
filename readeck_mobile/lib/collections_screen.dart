import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

ReadeckApiClient? globalApiClient;
Future<ReadeckApiClient> getApiClient() async {
  if (globalApiClient != null) return globalApiClient!;
  final prefs = await SharedPreferences.getInstance();
  final serverUrl = prefs.getString('serverUrl') ?? '';
  final token = prefs.getString('token');
  if (serverUrl.isEmpty || token == null) throw Exception('Not logged in');
  globalApiClient = ReadeckApiClient(baseUrl: serverUrl, token: token);
  return globalApiClient!;
}

class CollectionsScreen extends HookWidget {
  const CollectionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final collectionsFuture = useMemoized(
      () => getApiClient().then((api) => api.listCollections()),
      [],
    );
    final snapshot = useFuture(collectionsFuture);
    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      backgroundColor: isDark ? Colors.black : null,
      body: SafeArea(
        child: snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : snapshot.hasError
            ? Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(
                    color: isDark ? Colors.red[200] : Colors.red,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final c = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      c.name ?? 'No Name',
                      style: TextStyle(color: isDark ? Colors.white : null),
                    ),
                    subtitle: Text(
                      c.id ?? '',
                      style: TextStyle(color: isDark ? Colors.white70 : null),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
