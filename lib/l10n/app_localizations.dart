import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'QR Code Generator'**
  String get appTitle;

  /// No description provided for @inputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter text, URL, email, or phone number...'**
  String get inputHint;

  /// No description provided for @errorCorrectionLevel.
  ///
  /// In en, this message translates to:
  /// **'Error Correction Level'**
  String get errorCorrectionLevel;

  /// No description provided for @qrCodeSize.
  ///
  /// In en, this message translates to:
  /// **'QR Code Size'**
  String get qrCodeSize;

  /// No description provided for @downloadPng.
  ///
  /// In en, this message translates to:
  /// **'Save PNG'**
  String get downloadPng;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @errorLevel.
  ///
  /// In en, this message translates to:
  /// **'Error Level'**
  String get errorLevel;

  /// No description provided for @characterCount.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get characterCount;

  /// No description provided for @savedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully!'**
  String get savedSuccessfully;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save'**
  String get saveFailed;

  /// No description provided for @usageGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage Guide'**
  String get usageGuideTitle;

  /// No description provided for @websiteExample.
  ///
  /// In en, this message translates to:
  /// **'Website URL'**
  String get websiteExample;

  /// No description provided for @websiteExampleValue.
  ///
  /// In en, this message translates to:
  /// **'https://example.com'**
  String get websiteExampleValue;

  /// No description provided for @emailExample.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailExample;

  /// No description provided for @emailExampleValue.
  ///
  /// In en, this message translates to:
  /// **'mailto:user@example.com'**
  String get emailExampleValue;

  /// No description provided for @phoneExample.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneExample;

  /// No description provided for @phoneExampleValue.
  ///
  /// In en, this message translates to:
  /// **'tel:+1234567890'**
  String get phoneExampleValue;

  /// No description provided for @plainTextExample.
  ///
  /// In en, this message translates to:
  /// **'Plain Text'**
  String get plainTextExample;

  /// No description provided for @plainTextExampleValue.
  ///
  /// In en, this message translates to:
  /// **'Any text you want'**
  String get plainTextExampleValue;

  /// No description provided for @sizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small (200×200)'**
  String get sizeSmall;

  /// No description provided for @sizeMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium (300×300)'**
  String get sizeMedium;

  /// No description provided for @sizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large (400×400)'**
  String get sizeLarge;

  /// No description provided for @sizeExtraLarge.
  ///
  /// In en, this message translates to:
  /// **'Extra Large (500×500)'**
  String get sizeExtraLarge;

  /// No description provided for @lowLevel.
  ///
  /// In en, this message translates to:
  /// **'Low (7%) - L'**
  String get lowLevel;

  /// No description provided for @mediumLevel.
  ///
  /// In en, this message translates to:
  /// **'Medium (15%) - M'**
  String get mediumLevel;

  /// No description provided for @quartileLevel.
  ///
  /// In en, this message translates to:
  /// **'Quartile (25%) - Q'**
  String get quartileLevel;

  /// No description provided for @highLevel.
  ///
  /// In en, this message translates to:
  /// **'High (30%) - H'**
  String get highLevel;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
