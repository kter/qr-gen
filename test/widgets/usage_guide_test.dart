import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/widgets/usage_guide.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UsageGuide', () {
    testWidgets('displays usage guide title', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.text('Usage Guide'), findsOneWidget);
    });

    testWidgets('displays website example', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.text('Website URL'), findsOneWidget);
      expect(find.text('https://example.com'), findsOneWidget);
    });

    testWidgets('displays email example', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('mailto:user@example.com'), findsOneWidget);
    });

    testWidgets('displays phone example', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.text('Phone Number'), findsOneWidget);
      expect(find.text('tel:+1234567890'), findsOneWidget);
    });

    testWidgets('displays plain text example', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.text('Plain Text'), findsOneWidget);
      expect(find.text('Any text you want'), findsOneWidget);
    });

    testWidgets('has correct icons', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      expect(find.byIcon(Icons.language), findsOneWidget);
      expect(find.byIcon(Icons.email_outlined), findsOneWidget);
      expect(find.byIcon(Icons.phone_outlined), findsOneWidget);
      expect(find.byIcon(Icons.text_snippet_outlined), findsOneWidget);
    });

    testWidgets('wrapped in Card widget', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: UsageGuide()));

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
