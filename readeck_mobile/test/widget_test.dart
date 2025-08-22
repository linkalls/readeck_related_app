import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readeck_mobile/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Renders LoginScreen when not logged in',
      (WidgetTester tester) async {
    // Set up mock shared preferences
    SharedPreferences.setMockInitialValues({});

    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: ReadeckApp()));

    // Wait for a few frames to allow the initial async auth check to complete.
    // We use pump() with a duration to give some time for providers to initialize.
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // Verify that the LoginScreen is shown, by checking for the label text.
    expect(find.text('Server URL'), findsOneWidget);
  });
}
