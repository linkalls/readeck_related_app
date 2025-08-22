import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'config/router.dart';
import 'l10n/app_localizations.dart';
import 'providers/locale_provider.dart';
import 'providers/providers.dart';
import 'providers/theme_provider.dart';
import 'screens/screens.dart';
import 'screens/share_loading_screen.dart';
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

  // Handle initial shared data
  try {
    final initialMedia = await ReceiveSharingIntent.instance.getInitialMedia();
    print('Initial media received: ${initialMedia.length} items');

    if (initialMedia.isNotEmpty &&
        initialMedia.first.type == SharedMediaType.text) {
      final sharedText = initialMedia.first.path;
      print('Shared text received: $sharedText');

      if (sharedText.isNotEmpty) {
        // Reset sharing intent immediately to prevent duplicate processing
        ReceiveSharingIntent.instance.reset();

        // Launch main app with sharing intent instead of ShareHandlerApp
        runApp(ProviderScope(child: ReadeckApp(initialSharedText: sharedText)));
        return;
      }
    }
  } catch (e) {
    print("Failed to handle shared data: $e");
  }

  // Reset any pending intents if we are launching normally
  ReceiveSharingIntent.instance.reset();

  runApp(const ProviderScope(child: ReadeckApp()));
}

class ReadeckApp extends ConsumerWidget {
  final String? initialSharedText;

  const ReadeckApp({super.key, this.initialSharedText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authTokenProvider);
    final autoLoginAsync = ref.watch(autoLoginProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);

    // 共有サービスを監視して初期化
    final sharingService = ref.watch(sharingServiceProvider.notifier);

    // 共有インテントから起動された場合はローディング画面のみ表示
    if (initialSharedText != null && initialSharedText!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sharingService.handleInitialSharedText(initialSharedText!);
      });
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShareLoadingScreen(),
      );
    }

    // 通常起動時は従来通りrouterを使う
    return MaterialApp.router(
      locale: locale,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
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
      themeMode: themeMode,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
