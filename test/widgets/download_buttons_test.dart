import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/widgets/download_buttons.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DownloadButtons', () {
    testWidgets('does not render when no content', (tester) async {
      final qrProvider = QRProvider();
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: DownloadButtons(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // Buttons should not be visible - widget returns SizedBox.shrink()
      expect(find.text('Save PNG'), findsNothing);
      expect(find.text('Share'), findsNothing);
    });

    testWidgets('shows Save PNG button when content exists', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: DownloadButtons(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      expect(find.text('Save PNG'), findsOneWidget);
    });

    testWidgets('shows Share button when content exists', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: DownloadButtons(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      expect(find.text('Share'), findsOneWidget);
    });

    testWidgets('shows save icon when content exists', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: DownloadButtons(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      expect(find.byIcon(Icons.save_alt), findsOneWidget);
    });

    testWidgets('shows share icon when content exists', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: DownloadButtons(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('renders both buttons in same view', (tester) async {
      final qrProvider = QRProvider();
      qrProvider.setContent('test');
      final qrKey = GlobalKey();

      await pumpApp(
        tester,
        child: Scaffold(body: DownloadButtons(repaintBoundaryKey: qrKey)),
        qrProvider: qrProvider,
      );

      // Verify both Save PNG and Share are visible together
      expect(find.text('Save PNG'), findsOneWidget);
      expect(find.text('Share'), findsOneWidget);
      expect(find.byIcon(Icons.save_alt), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);
    });
  });
}
