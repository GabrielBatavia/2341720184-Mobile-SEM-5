// lib/stream.dart
import 'dart:async';
import 'package:flutter/material.dart';

class ColorStream {
  /// Daftar warna yang akan diputar setiap detik
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // 5 warna tambahan (Soal 2)
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.lime,
  ];

  /// Menghasilkan stream warna yang berubah setiap 1 detik
  Stream<Color> getColors() async* {
    // yield* = meneruskan (forward) semua event dari Stream.periodic
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        final int index = t % colors.length;
        return colors[index];
      },
    );
  }
}
