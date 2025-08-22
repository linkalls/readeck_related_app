import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/router.dart';
import 'l10n/app_localizations.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';
import 'services/database_service.dart';
import 'utils/api_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Handle initial shared data
  try {
    final initialMedia = await ReceiveSharingIntent.instance.getInitialMedia();
    if (initialMedia.isNotEmpty &&
        initialMedia.first.type == SharedMediaType.text) {
      final sharedText = initialMedia.first.path;
      if (sharedText.isNotEmpty) {
        runApp(ShareHandlerApp(sharedText: sharedText));
        // Reset the intent to avoid processing it again
        ReceiveSharingIntent.instance.reset();
        return;
      }
    }
  } catch (e) {
    print("Failed to handle shared data: $e");
  }

  // Reset any pending intents if we are launching normally
  ReceiveSharingIntent.instance.reset();

  // データベースの初期化
  try {
    await DatabaseService.database;
    print('Database initialized successfully');
  } catch (e) {
    print('Failed to initialize database: $e');
  }

  runApp(const ProviderScope(child: ReadeckApp()));
}

class ShareHandlerApp extends StatefulWidget {
  final String sharedText;
  const ShareHandlerApp({super.key, required this.sharedText});

  @override
  State<ShareHandlerApp> createState() => _ShareHandlerAppState();
}

class _ShareHandlerAppState extends State<ShareHandlerApp> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to ensure ScaffoldMessenger is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleShareAndExit();
    });
  }

  Future<void> _handleShareAndExit() async {
    bool success = false;
    try {
      final url = _extractUrl(widget.sharedText);
      if (url != null) {
        final prefs = await SharedPreferences.getInstance();
        final serverUrl = prefs.getString('serverUrl');
        final token = prefs.getString('token');

        if (serverUrl != null && token != null) {
          final client = ReadeckApiClient(baseUrl: serverUrl, token: token);
          await client.createBookmark(BookmarkCreate(url: url, labels: ['shared']));
          success = true;
        }
      }
    } catch (e) {
      print("Failed to create bookmark from shared URL: $e");
      success = false;
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success
              ? "ブックマークを受け取りました！"
              : "ブックマークの作成に失敗しました"),
        ),
      );
    }

    // Wait for SnackBar to be visible and then exit
    await Future.delayed(const Duration(seconds: 2));
    SystemNavigator.pop();
  }

  String? _extractUrl(String text) {
    final urlRegex = RegExp(r'https?://[^\s]+', caseSensitive: false);
    final match = urlRegex.firstMatch(text);
    return match?.group(0);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
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
      themeMode: ThemeMode.system,
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
