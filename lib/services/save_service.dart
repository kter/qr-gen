import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

/// Service for saving QR code images
class SaveService {
  /// Request storage permission
  static Future<bool> requestPermission() async {
    final hasAccess = await Gal.hasAccess();
    if (hasAccess) return true;
    
    return await Gal.requestAccess();
  }

  /// Save PNG image to gallery
  static Future<bool> savePng({
    required GlobalKey repaintBoundaryKey,
    required String filename,
  }) async {
    try {
      final hasPermission = await requestPermission();
      if (!hasPermission) {
        return false;
      }

      final boundary = repaintBoundaryKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      
      if (boundary == null) {
        return false;
      }

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      
      if (byteData == null) {
        return false;
      }

      final bytes = byteData.buffer.asUint8List();
      
      // Save to temporary file first, then to gallery
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$filename.png');
      await file.writeAsBytes(bytes);
      
      await Gal.putImage(file.path, album: 'QR Generator');
      
      // Clean up temp file
      await file.delete();
      
      return true;
    } catch (e) {
      debugPrint('Error saving PNG: $e');
      return false;
    }
  }

  /// Generate SVG string for QR code
  static String generateSvgString({
    required List<List<bool>> qrModules,
    required int size,
    Color foreground = Colors.black,
    Color background = Colors.white,
  }) {
    final moduleCount = qrModules.length;
    final moduleSize = size / moduleCount;
    
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<svg xmlns="http://www.w3.org/2000/svg" width="$size" height="$size" viewBox="0 0 $size $size">');
    
    // Background
    final bgColor = _colorToHex(background);
    buffer.writeln('  <rect width="100%" height="100%" fill="$bgColor"/>');
    
    // QR modules
    final fgColor = _colorToHex(foreground);
    for (var y = 0; y < moduleCount; y++) {
      for (var x = 0; x < moduleCount; x++) {
        if (qrModules[y][x]) {
          final px = x * moduleSize;
          final py = y * moduleSize;
          buffer.writeln('  <rect x="$px" y="$py" width="$moduleSize" height="$moduleSize" fill="$fgColor"/>');
        }
      }
    }
    
    buffer.writeln('</svg>');
    return buffer.toString();
  }

  static String _colorToHex(Color color) {
    final r = (color.r * 255).round();
    final g = (color.g * 255).round();
    final b = (color.b * 255).round();
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}';
  }

  /// Save SVG to gallery (as PNG since gallery doesn't support SVG directly)
  static Future<bool> saveSvg({
    required GlobalKey repaintBoundaryKey,
    required String filename,
  }) async {
    // SVG saving will use the same PNG method for now
    // as most gallery apps don't support SVG viewing
    return savePng(repaintBoundaryKey: repaintBoundaryKey, filename: filename);
  }
}
