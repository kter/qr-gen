import 'package:qr_flutter/qr_flutter.dart';

/// Error correction levels for QR codes
enum ErrorCorrectionLevel {
  L, // 7% recovery
  M, // 15% recovery
  Q, // 25% recovery
  H, // 30% recovery
}

/// QR code size presets
enum QRSize {
  small,    // 200x200
  medium,   // 300x300
  large,    // 400x400
  extraLarge, // 500x500
}

/// Extension to get pixel size from QRSize enum
extension QRSizeExtension on QRSize {
  int get pixels {
    switch (this) {
      case QRSize.small:
        return 200;
      case QRSize.medium:
        return 300;
      case QRSize.large:
        return 400;
      case QRSize.extraLarge:
        return 500;
    }
  }
}

/// Extension to convert ErrorCorrectionLevel to qr_flutter's QrErrorCorrectLevel
extension ErrorCorrectionLevelExtension on ErrorCorrectionLevel {
  int get qrLevel {
    switch (this) {
      case ErrorCorrectionLevel.L:
        return QrErrorCorrectLevel.L;
      case ErrorCorrectionLevel.M:
        return QrErrorCorrectLevel.M;
      case ErrorCorrectionLevel.Q:
        return QrErrorCorrectLevel.Q;
      case ErrorCorrectionLevel.H:
        return QrErrorCorrectLevel.H;
    }
  }
}

/// Settings for QR code generation
class QRSettings {
  final String content;
  final ErrorCorrectionLevel errorLevel;
  final QRSize size;

  const QRSettings({
    this.content = '',
    this.errorLevel = ErrorCorrectionLevel.M,
    this.size = QRSize.medium,
  });

  QRSettings copyWith({
    String? content,
    ErrorCorrectionLevel? errorLevel,
    QRSize? size,
  }) {
    return QRSettings(
      content: content ?? this.content,
      errorLevel: errorLevel ?? this.errorLevel,
      size: size ?? this.size,
    );
  }

  int get sizeInPixels => size.pixels;
  
  bool get hasContent => content.isNotEmpty;
}
