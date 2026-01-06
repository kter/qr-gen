import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/qr_provider.dart';
import '../services/save_service.dart';

/// Download and share buttons for QR code
class DownloadButtons extends StatefulWidget {
  final GlobalKey repaintBoundaryKey;

  const DownloadButtons({
    super.key,
    required this.repaintBoundaryKey,
  });

  @override
  State<DownloadButtons> createState() => _DownloadButtonsState();
}

class _DownloadButtonsState extends State<DownloadButtons> {
  bool _isSavingPng = false;
  bool _isSharing = false;

  Future<void> _savePng() async {
    if (_isSavingPng) return;

    setState(() => _isSavingPng = true);

    final success = await SaveService.savePng(
      repaintBoundaryKey: widget.repaintBoundaryKey,
      filename: 'qr_code_${DateTime.now().millisecondsSinceEpoch}',
    );

    if (!mounted) return;

    setState(() => _isSavingPng = false);

    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? l10n.savedSuccessfully : l10n.saveFailed),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _share() async {
    if (_isSharing) return;

    setState(() => _isSharing = true);

    try {
      final boundary = widget.repaintBoundaryKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      
      if (boundary == null) {
        setState(() => _isSharing = false);
        return;
      }

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      
      if (byteData == null) {
        setState(() => _isSharing = false);
        return;
      }

      final bytes = byteData.buffer.asUint8List();
      
      // Save to temporary file
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/qr_code_share.png');
      await file.writeAsBytes(bytes);
      
      // Share the file
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'QR Code',
      );
      
    } catch (e) {
      debugPrint('Error sharing: $e');
    }

    if (!mounted) return;
    setState(() => _isSharing = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<QRProvider>(
      builder: (context, provider, child) {
        if (!provider.hasContent) {
          return const SizedBox.shrink();
        }

        return Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _isSavingPng ? null : _savePng,
                icon: _isSavingPng
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save_alt),
                label: Text(l10n.downloadPng),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _isSharing ? null : _share,
                icon: _isSharing
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.share),
                label: Text(l10n.share),
              ),
            ),
          ],
        );
      },
    );
  }
}
