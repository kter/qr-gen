import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/widgets/input_section.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('InputSection', () {
    testWidgets('displays hint text', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: InputSection()));

      expect(
        find.text('Enter text, URL, email, or phone number...'),
        findsOneWidget,
      );
    });

    testWidgets('updates provider when text is entered', (tester) async {
      final qrProvider = QRProvider();

      await pumpApp(
        tester,
        child: const Scaffold(body: InputSection()),
        qrProvider: qrProvider,
      );

      // Initially no content
      expect(qrProvider.hasContent, false);

      // Enter text
      await tester.enterText(find.byType(TextField), 'https://example.com');
      await tester.pumpAndSettle();

      // Provider should be updated
      expect(qrProvider.hasContent, true);
      expect(qrProvider.content, 'https://example.com');
    });

    testWidgets('accepts multi-line input', (tester) async {
      final qrProvider = QRProvider();

      await pumpApp(
        tester,
        child: const Scaffold(body: InputSection()),
        qrProvider: qrProvider,
      );

      const multiLineText = 'Line 1\nLine 2\nLine 3';
      await tester.enterText(find.byType(TextField), multiLineText);
      await tester.pumpAndSettle();

      expect(qrProvider.content, multiLineText);
      expect(qrProvider.characterCount, multiLineText.length);
    });

    testWidgets('renders inside a Card widget', (tester) async {
      await pumpApp(tester, child: const Scaffold(body: InputSection()));

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
