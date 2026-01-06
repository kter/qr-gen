import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../providers/qr_provider.dart';
import '../models/qr_settings.dart';

/// Widget to display the generated QR code
class QRDisplay extends StatelessWidget {
  final GlobalKey repaintBoundaryKey;

  const QRDisplay({
    super.key,
    required this.repaintBoundaryKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<QRProvider>(
      builder: (context, provider, child) {
        if (!provider.hasContent) {
          return const SizedBox.shrink();
        }

        final size = provider.size.pixels.toDouble();
        
        return RepaintBoundary(
          key: repaintBoundaryKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: QrImageView(
              data: provider.content,
              version: QrVersions.auto,
              size: size,
              errorCorrectionLevel: provider.errorLevel.qrLevel,
              backgroundColor: Colors.white,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.black,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
