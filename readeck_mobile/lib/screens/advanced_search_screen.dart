import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:go_router/go_router.dart";

import '../providers/providers.dart';

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
              theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
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
                                context.pop();
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
                            context.pop();
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
