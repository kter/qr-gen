// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'QR Code Generator';

  @override
  String get inputHint => 'Enter text, URL, email, or phone number...';

  @override
  String get errorCorrectionLevel => 'Error Correction Level';

  @override
  String get qrCodeSize => 'QR Code Size';

  @override
  String get downloadPng => 'Save PNG';

  @override
  String get share => 'Share';

  @override
  String get size => 'Size';

  @override
  String get errorLevel => 'Error Level';

  @override
  String get characterCount => 'Characters';

  @override
  String get savedSuccessfully => 'Saved successfully!';

  @override
  String get saveFailed => 'Failed to save';

  @override
  String get usageGuideTitle => 'Usage Guide';

  @override
  String get websiteExample => 'Website URL';

  @override
  String get websiteExampleValue => 'https://example.com';

  @override
  String get emailExample => 'Email Address';

  @override
  String get emailExampleValue => 'mailto:user@example.com';

  @override
  String get phoneExample => 'Phone Number';

  @override
  String get phoneExampleValue => 'tel:+1234567890';

  @override
  String get plainTextExample => 'Plain Text';

  @override
  String get plainTextExampleValue => 'Any text you want';

  @override
  String get sizeSmall => 'Small (200×200)';

  @override
  String get sizeMedium => 'Medium (300×300)';

  @override
  String get sizeLarge => 'Large (400×400)';

  @override
  String get sizeExtraLarge => 'Extra Large (500×500)';

  @override
  String get lowLevel => 'Low (7%) - L';

  @override
  String get mediumLevel => 'Medium (15%) - M';

  @override
  String get quartileLevel => 'Quartile (25%) - Q';

  @override
  String get highLevel => 'High (30%) - H';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get systemMode => 'System';
}
