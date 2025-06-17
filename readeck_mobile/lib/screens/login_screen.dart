import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/providers.dart';
import '../utils/api_client.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateProvider);
    final notifier = ref.read(loginStateProvider.notifier);
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final serverUrlController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withValues(alpha: 0.1),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    Icons.bookmark_rounded,
                    size: 48,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Welcome to Readeck',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to access your bookmarks',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 48),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: serverUrlController,
                            decoration: const InputDecoration(
                              labelText: 'Server URL',
                              prefixIcon: Icon(Icons.dns_rounded),
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person_rounded),
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_rounded),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 24),
                          if (state.error != null) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline_rounded,
                                    color: theme.colorScheme.error,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      state.error!,
                                      style: TextStyle(
                                        color:
                                            theme.colorScheme.onErrorContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () async {
                                      if (!(formKey.currentState?.validate() ??
                                          false)) {
                                        return;
                                      }
                                      notifier.state = state.copyWith(
                                        isLoading: true,
                                        error: null,
                                      );

                                      final rawUrl = serverUrlController.text
                                          .trim();
                                      final username = usernameController.text
                                          .trim();
                                      final password = passwordController.text;

                                      var normalizedUrl = rawUrl;
                                      if (!RegExp(
                                        r'https?://',
                                      ).hasMatch(normalizedUrl)) {
                                        normalizedUrl = 'http://$normalizedUrl';
                                      }
                                      if (normalizedUrl.endsWith('/')) {
                                        normalizedUrl = normalizedUrl.substring(
                                          0,
                                          normalizedUrl.length - 1,
                                        );
                                      }

                                      try {
                                        final client = ReadeckApiClient(
                                          baseUrl: normalizedUrl,
                                        );
                                        final res = await client.login(
                                          AuthRequest(
                                            username: username,
                                            password: password,
                                            application: 'readeck_mobile',
                                          ),
                                        );
                                        if (res.token == null) {
                                          throw Exception('No token');
                                        }

                                        setGlobalApiClient(
                                          normalizedUrl,
                                          res.token!,
                                        );
                                        ref
                                            .read(authTokenProvider.notifier)
                                            .state = res
                                            .token;
                                        final prefs =
                                            await SharedPreferences.getInstance();
                                        await prefs.setString(
                                          'serverUrl',
                                          normalizedUrl,
                                        );
                                        await prefs.setString(
                                          'token',
                                          res.token!,
                                        );

                                        if (context.mounted) context.go('/');
                                      } catch (e) {
                                        notifier.state = state.copyWith(
                                          isLoading: false,
                                          error: e.toString(),
                                        );
                                        return;
                                      }
                                      notifier.state = state.copyWith(
                                        isLoading: false,
                                      );
                                    },
                              child: state.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Sign In'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
