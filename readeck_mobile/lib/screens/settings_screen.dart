import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/locale_provider.dart';
import '../providers/providers.dart';
import '../providers/theme_provider.dart';
import '../utils/api_client.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/');
        }
      },
      child: Scaffold(
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
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: () {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          } else {
                            context.go('/');
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
                            onTap: () async {
                              // ローディング状態を示すスナックバーを表示
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Row(
                                    children: [
                                      SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(strokeWidth: 2),
                                      ),
                                      SizedBox(width: 16),
                                      Text('Preparing logout...'),
                                    ],
                                  ),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              
                              // 少し待ってからダイアログを表示（UXの改善）
                              await Future.delayed(const Duration(milliseconds: 300));
                              
                              // ローディングスナックバーを隠す
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              }
                              
                              // ログアウト確認ダイアログを表示
                              final shouldLogout = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Logout'),
                                  content: const Text('Are you sure you want to sign out?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(true),
                                      child: const Text('Logout'),
                                    ),
                                  ],
                                ),
                              );
                              
                              if (shouldLogout == true) {
                                // ログアウト処理中を表示
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Row(
                                        children: [
                                          SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(strokeWidth: 2),
                                          ),
                                          SizedBox(width: 16),
                                          Text('Logging out...'),
                                        ],
                                      ),
                                      duration: Duration(seconds: 5),
                                    ),
                                  );
                                }
                                
                                try {
                                  final api = await getApiClient();
                                  await api.logout();
                                  
                                  // 設定をクリア
                                  final clearSettings = ref.read(clearSettingsProvider);
                                  await clearSettings();
                                  
                                  // ホーム画面に戻る
                                  if (context.mounted) {
                                    context.go('/');
                                  }
                                  
                                  // 成功メッセージを表示
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Successfully logged out'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  // エラーハンドリング
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Logout failed: $e'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appearance',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            leading: const Icon(Icons.language_rounded),
                            title: const Text('Language'),
                            subtitle: Text(
                              (Locale? locale) {
                                if (locale == null) return 'System Default';
                                if (locale.languageCode == 'ja') return '日本語';
                                if (locale.languageCode == 'en') return 'English';
                                return 'Unknown';
                              }(ref.watch(localeProvider)),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final currentLocale = ref.watch(localeProvider);
                                  return AlertDialog(
                                    title: const Text('Select Language'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile<Locale?>(
                                          title: const Text('System Default'),
                                          value: null,
                                          groupValue: currentLocale,
                                          onChanged: (locale) {
                                            ref
                                                .read(localeProvider.notifier)
                                                .setLocale(null);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        RadioListTile<Locale?>(
                                          title: const Text('English'),
                                          value: const Locale('en'),
                                          groupValue: currentLocale,
                                          onChanged: (locale) {
                                            ref
                                                .read(localeProvider.notifier)
                                                .setLocale(const Locale('en'));
                                            Navigator.pop(context);
                                          },
                                        ),
                                        RadioListTile<Locale?>(
                                          title: const Text('日本語'),
                                          value: const Locale('ja'),
                                          groupValue: currentLocale,
                                          onChanged: (locale) {
                                            ref
                                                .read(localeProvider.notifier)
                                                .setLocale(const Locale('ja'));
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.brightness_6_rounded),
                            title: const Text('Theme'),
                            subtitle: Text(
                              (ThemeMode themeMode) {
                                switch (themeMode) {
                                  case ThemeMode.light:
                                    return 'Light';
                                  case ThemeMode.dark:
                                    return 'Dark';
                                  case ThemeMode.system:
                                    return 'System Default';
                                }
                              }(ref.watch(themeProvider)),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final currentTheme = ref.watch(themeProvider);
                                  return AlertDialog(
                                    title: const Text('Select Theme'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile<ThemeMode>(
                                          title: const Text('System Default'),
                                          value: ThemeMode.system,
                                          groupValue: currentTheme,
                                          onChanged: (theme) {
                                            ref
                                                .read(themeProvider.notifier)
                                                .setTheme(ThemeMode.system);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        RadioListTile<ThemeMode>(
                                          title: const Text('Light'),
                                          value: ThemeMode.light,
                                          groupValue: currentTheme,
                                          onChanged: (theme) {
                                            ref
                                                .read(themeProvider.notifier)
                                                .setTheme(ThemeMode.light);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        RadioListTile<ThemeMode>(
                                          title: const Text('Dark'),
                                          value: ThemeMode.dark,
                                          groupValue: currentTheme,
                                          onChanged: (theme) {
                                            ref
                                                .read(themeProvider.notifier)
                                                .setTheme(ThemeMode.dark);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
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
      ),
    );
  }
}
