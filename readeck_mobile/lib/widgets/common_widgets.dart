import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/providers.dart';
import '../services/database_service.dart';
import '../utils/api_client.dart';

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
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  bookmark.siteName!,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.7),
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
                                  : theme.colorScheme.onSurface.withValues(
                                      alpha: 0.6,
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
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ],
              ),
              if (bookmark.description != null &&
                  bookmark.description!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  bookmark.description!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
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
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(bookmark.created!),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
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

      // SQLiteに保存（DatabaseServiceを利用）
      await DatabaseService.saveBookmarkContent(bookmark.id!, markdownContent);

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

class LabelChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const LabelChip({required this.label, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ConnectivityWrapper extends ConsumerWidget {
  final Widget child;

  const ConnectivityWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const OfflineIndicator(),
        Expanded(child: child),
      ],
    );
  }
}

class OfflineIndicator extends ConsumerWidget {
  const OfflineIndicator({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ここでは常にオンライン表示として簡略化
    // 実際のアプリではconnectivity_plusなどで実装
    return const SizedBox.shrink();
  }
}
