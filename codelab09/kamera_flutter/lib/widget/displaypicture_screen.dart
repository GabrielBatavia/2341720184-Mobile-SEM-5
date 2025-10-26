// lib/widget/displaypicture_screen.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';

/// A widget that displays the picture taken by the user.
/// Gunakan bytes agar kompatibel dengan Flutter Web & Mobile.
class DisplayPictureScreen extends StatelessWidget {
  final Uint8List imageBytes;
  final String? imagePath; // opsional, untuk debugging/menampilkan info

  const DisplayPictureScreen({
    super.key,
    required this.imageBytes,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2341720184 ')),
      body: Center(
        child: Image.memory(
          imageBytes,
          fit: BoxFit.contain,
        ),
      ),
      bottomNavigationBar: imagePath == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Path: $imagePath',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
    );
  }
}
