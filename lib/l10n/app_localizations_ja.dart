// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'QRコード生成';

  @override
  String get inputHint => 'テキスト、URL、メール、電話番号を入力...';

  @override
  String get errorCorrectionLevel => '誤り訂正レベル';

  @override
  String get qrCodeSize => 'QRコードサイズ';

  @override
  String get downloadPng => 'PNGで保存';

  @override
  String get share => '共有';

  @override
  String get size => 'サイズ';

  @override
  String get errorLevel => '誤り訂正';

  @override
  String get characterCount => '文字数';

  @override
  String get savedSuccessfully => '保存しました！';

  @override
  String get saveFailed => '保存に失敗しました';

  @override
  String get usageGuideTitle => '使い方ガイド';

  @override
  String get websiteExample => 'ウェブサイト';

  @override
  String get websiteExampleValue => 'https://example.com';

  @override
  String get emailExample => 'メールアドレス';

  @override
  String get emailExampleValue => 'mailto:user@example.com';

  @override
  String get phoneExample => '電話番号';

  @override
  String get phoneExampleValue => 'tel:+1234567890';

  @override
  String get plainTextExample => 'テキスト';

  @override
  String get plainTextExampleValue => '任意の文字列';

  @override
  String get sizeSmall => '小 (200×200)';

  @override
  String get sizeMedium => '中 (300×300)';

  @override
  String get sizeLarge => '大 (400×400)';

  @override
  String get sizeExtraLarge => '特大 (500×500)';

  @override
  String get lowLevel => '低 (7%) - L';

  @override
  String get mediumLevel => '中 (15%) - M';

  @override
  String get quartileLevel => '高 (25%) - Q';

  @override
  String get highLevel => '最高 (30%) - H';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get lightMode => 'ライトモード';

  @override
  String get systemMode => 'システム設定';
}
