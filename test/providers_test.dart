import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_gen_app/models/qr_settings.dart';
import 'package:qr_gen_app/providers/qr_provider.dart';
import 'package:qr_gen_app/providers/theme_provider.dart';

void main() {
  group('QRProvider', () {
    test('initial state has no content', () {
      final provider = QRProvider();

      expect(provider.hasContent, false);
      expect(provider.content, '');
      expect(provider.characterCount, 0);
    });

    test('setContent updates content and notifies listeners', () {
      final provider = QRProvider();
      var notified = false;
      provider.addListener(() => notified = true);

      provider.setContent('test');

      expect(provider.content, 'test');
      expect(provider.hasContent, true);
      expect(provider.characterCount, 4);
      expect(notified, true);
    });

    test('setContent does not notify if value unchanged', () {
      final provider = QRProvider();
      provider.setContent('test');

      var notified = false;
      provider.addListener(() => notified = true);

      provider.setContent('test');

      expect(notified, false);
    });

    test('default error level is M', () {
      final provider = QRProvider();

      expect(provider.errorLevel, ErrorCorrectionLevel.M);
    });

    test('setErrorLevel updates error level', () {
      final provider = QRProvider();
      var notified = false;
      provider.addListener(() => notified = true);

      provider.setErrorLevel(ErrorCorrectionLevel.H);

      expect(provider.errorLevel, ErrorCorrectionLevel.H);
      expect(notified, true);
    });

    test('setErrorLevel does not notify if value unchanged', () {
      final provider = QRProvider();

      var notified = false;
      provider.addListener(() => notified = true);

      provider.setErrorLevel(ErrorCorrectionLevel.M);

      expect(notified, false);
    });

    test('default size is medium', () {
      final provider = QRProvider();

      expect(provider.size, QRSize.medium);
    });

    test('setSize updates size', () {
      final provider = QRProvider();
      var notified = false;
      provider.addListener(() => notified = true);

      provider.setSize(QRSize.large);

      expect(provider.size, QRSize.large);
      expect(notified, true);
    });

    test('setSize does not notify if value unchanged', () {
      final provider = QRProvider();

      var notified = false;
      provider.addListener(() => notified = true);

      provider.setSize(QRSize.medium);

      expect(notified, false);
    });

    test('clear resets all settings to defaults', () {
      final provider = QRProvider();

      provider.setContent('test');
      provider.setErrorLevel(ErrorCorrectionLevel.H);
      provider.setSize(QRSize.large);

      provider.clear();

      expect(provider.content, '');
      expect(provider.hasContent, false);
      expect(provider.errorLevel, ErrorCorrectionLevel.M);
      expect(provider.size, QRSize.medium);
    });
  });

  group('ThemeProvider', () {
    test('initial theme mode is system', () {
      final provider = ThemeProvider();

      expect(provider.themeMode, ThemeMode.system);
    });

    test('toggleTheme switches from system to dark', () {
      final provider = ThemeProvider();

      provider.toggleTheme();

      expect(provider.themeMode, ThemeMode.dark);
    });

    test('toggleTheme switches from dark to light', () {
      final provider = ThemeProvider();

      provider.toggleTheme(); // system -> dark
      provider.toggleTheme(); // dark -> light

      expect(provider.themeMode, ThemeMode.light);
    });

    test('toggleTheme switches from light to dark', () {
      final provider = ThemeProvider();

      provider.toggleTheme(); // system -> dark
      provider.toggleTheme(); // dark -> light
      provider.toggleTheme(); // light -> dark

      expect(provider.themeMode, ThemeMode.dark);
    });

    test('setThemeMode updates theme and notifies', () {
      final provider = ThemeProvider();
      var notified = false;
      provider.addListener(() => notified = true);

      provider.setThemeMode(ThemeMode.dark);

      expect(provider.themeMode, ThemeMode.dark);
      expect(notified, true);
    });

    test('setThemeMode does not notify if unchanged', () {
      final provider = ThemeProvider();

      var notified = false;
      provider.addListener(() => notified = true);

      provider.setThemeMode(ThemeMode.system);

      expect(notified, false);
    });
  });

  group('QRSettings', () {
    test('default values are correct', () {
      const settings = QRSettings();

      expect(settings.content, '');
      expect(settings.errorLevel, ErrorCorrectionLevel.M);
      expect(settings.size, QRSize.medium);
      expect(settings.hasContent, false);
    });

    test('copyWith creates new instance with updated values', () {
      const original = QRSettings();

      final updated = original.copyWith(
        content: 'test',
        errorLevel: ErrorCorrectionLevel.H,
        size: QRSize.large,
      );

      expect(updated.content, 'test');
      expect(updated.errorLevel, ErrorCorrectionLevel.H);
      expect(updated.size, QRSize.large);
      expect(updated.hasContent, true);
    });

    test('copyWith preserves unspecified values', () {
      const original = QRSettings(
        content: 'test',
        errorLevel: ErrorCorrectionLevel.H,
        size: QRSize.large,
      );

      final updated = original.copyWith(content: 'new');

      expect(updated.content, 'new');
      expect(updated.errorLevel, ErrorCorrectionLevel.H);
      expect(updated.size, QRSize.large);
    });

    test('sizeInPixels returns correct pixel values', () {
      expect(const QRSettings(size: QRSize.small).sizeInPixels, 200);
      expect(const QRSettings(size: QRSize.medium).sizeInPixels, 300);
      expect(const QRSettings(size: QRSize.large).sizeInPixels, 400);
      expect(const QRSettings(size: QRSize.extraLarge).sizeInPixels, 500);
    });
  });

  group('QRSize extension', () {
    test('pixels returns correct values', () {
      expect(QRSize.small.pixels, 200);
      expect(QRSize.medium.pixels, 300);
      expect(QRSize.large.pixels, 400);
      expect(QRSize.extraLarge.pixels, 500);
    });
  });

  group('ErrorCorrectionLevel extension', () {
    test('qrLevel returns correct values', () {
      expect(ErrorCorrectionLevel.L.qrLevel, 1);
      expect(ErrorCorrectionLevel.M.qrLevel, 0);
      expect(ErrorCorrectionLevel.Q.qrLevel, 3);
      expect(ErrorCorrectionLevel.H.qrLevel, 2);
    });
  });
}
