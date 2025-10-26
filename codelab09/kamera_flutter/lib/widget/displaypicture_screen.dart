// lib/widget/displaypicture_screen.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'filter_carousel.dart';

/// Menampilkan foto yang baru diambil, dan tombol untuk membuka filter.
class DisplayPictureScreen extends StatelessWidget {
  final Uint8List imageBytes;    // FOTO DALAM BYTES (aman utk Web & Mobile)
  final String? imagePath;       // opsional, hanya untuk info/log

  const DisplayPictureScreen({
    super.key,
    required this.imageBytes,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 23141720184')),
      body: Center(
        child: Image.memory(
          imageBytes,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.palette),
        label: const Text('Edit with Filter'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PhotoFilterCarousel(imageBytes: imageBytes),
            ),
          );
        },
      ),
    );
  }
}
