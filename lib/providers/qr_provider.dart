import 'package:flutter/material.dart';
import '../models/qr_settings.dart';

/// Provider for QR code generation state
class QRProvider extends ChangeNotifier {
  QRSettings _settings = const QRSettings();

  QRSettings get settings => _settings;
  String get content => _settings.content;
  ErrorCorrectionLevel get errorLevel => _settings.errorLevel;
  QRSize get size => _settings.size;
  bool get hasContent => _settings.hasContent;
  int get characterCount => _settings.content.length;

  void setContent(String value) {
    if (_settings.content != value) {
      _settings = _settings.copyWith(content: value);
      notifyListeners();
    }
  }

  void setErrorLevel(ErrorCorrectionLevel level) {
    if (_settings.errorLevel != level) {
      _settings = _settings.copyWith(errorLevel: level);
      notifyListeners();
    }
  }

  void setSize(QRSize size) {
    if (_settings.size != size) {
      _settings = _settings.copyWith(size: size);
      notifyListeners();
    }
  }

  void clear() {
    _settings = const QRSettings();
    notifyListeners();
  }
}
