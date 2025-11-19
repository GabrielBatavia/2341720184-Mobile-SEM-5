// lib/main.dart
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tetap pakai nama kamu (Soal 1 praktikum 1)
      title: 'Stream — Gabriel Batavia',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // PRAKTIKUM 1: warna background
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // PRAKTIKUM 2: angka dari NumberStream
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  @override
  void initState() {
    super.initState();

    // --- Praktikum 1: mulai stream warna ---
    colorStream = ColorStream();
    changeColor();

    // --- Praktikum 2: setup NumberStream & listener ---
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    Stream<int> stream = numberStreamController.stream;
    stream.listen((event) {
      // dipanggil setiap ada angka baru
      setState(() {
        lastNumber = event;
      });
    }).onError((error) {
      // Langkah 14: kalau ada error, tampilkan -1
      setState(() {
        lastNumber = -1;
      });
    });
  }

  // Praktikum 1: ubah warna background berdasarkan ColorStream
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  void dispose() {
    // Langkah 9: tutup controller ketika widget dibuang
    numberStreamController.close();
    super.dispose();
  }

  // Langkah 10 (versi akhir setelah Soal 7):
  // generate angka random dan kirim ke sink
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // 0..9
    numberStream.addNumberToSink(myNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream — Gabriel Batavia'),
      ),
      body: Container(
        color: bgColor, // tetap pakai background warna dari praktikum 1
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
