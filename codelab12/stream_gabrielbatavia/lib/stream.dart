// lib/stream.dart
import 'dart:async';
import 'package:flutter/material.dart';

/// PRAKTIKUM 1: Stream warna background
class ColorStream {
  /// Daftar warna yang akan diputar setiap detik
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // Tambahan 5 warna (Soal 2 praktikum 1)
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.lime,
  ];

  /// Menghasilkan stream warna yang berubah setiap 1 detik
  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        final int index = t % colors.length;
        return colors[index];
      },
    );
  }
}

/// PRAKTIKUM 2: StreamController & sink untuk bilangan
class NumberStream {
  /// Mengelola aliran bilangan integer
  final StreamController<int> controller = StreamController<int>();

  /// Menambahkan angka baru ke sink (akan diteruskan ke stream)
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  /// Langkah 13: mengirim error ke stream
  void addError() {
    controller.sink.addError('error');
  }

  /// Menutup controller ketika sudah tidak dipakai
  void close() {
    controller.close();
  }
}
