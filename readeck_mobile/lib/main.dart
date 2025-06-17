import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'config/router.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
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

class ReadeckApp extends ConsumerWidget {
  const ReadeckApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authTokenProvider);
    final autoLoginAsync = ref.watch(autoLoginProvider);

    // 共有サービスを監視して初期化
    ref.watch(sharingServiceProvider);

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
      routerConfig: router,
      builder: (context, child) {
        return autoLoginAsync.when(
          data: (isLoggedIn) {
            if (token == null && !isLoggedIn) {
              return const LoginScreen();
            }
            return child ?? const SizedBox.shrink();
          },
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (error, _) => const LoginScreen(),
        );
      },
    );
  }
}
