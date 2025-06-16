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

class LabelsScreen extends HookWidget {
  const LabelsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final labelsFuture = useMemoized(
      () => getApiClient().then((api) => api.listLabels()),
      [],
    );
    final snapshot = useFuture(labelsFuture);
    return Scaffold(
      appBar: AppBar(title: const Text('Labels')),
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
                  final l = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      l.name ?? 'No Name',
                      style: TextStyle(color: isDark ? Colors.white : null),
                    ),
                    subtitle: Text(
                      'Count: ${l.count ?? 0}',
                      style: TextStyle(color: isDark ? Colors.white70 : null),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
