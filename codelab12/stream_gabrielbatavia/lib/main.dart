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

  // PRAKTIKUM 2 & 3: angka dan stream controller
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  // PRAKTIKUM 3: transformer untuk memanipulasi data stream
  late StreamTransformer<int, int> transformer;

  @override
  void initState() {
    super.initState();

    // --- Praktikum 1: mulai stream warna ---
    colorStream = ColorStream();
    changeColor();

    // --- Praktikum 2: setup NumberStream & controller ---
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // --- Praktikum 3: definisi transformer (Langkah 2) ---
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        // setiap angka dikali 10 sebelum dikirim ke listener
        sink.add(value * 10);
      },
      handleError: (error, stackTrace, sink) {
        // kalau ada error, kirim -1 ke listener
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

    // --- Praktikum 3: pakai transform() sebelum listen (Langkah 3) ---
    Stream<int> stream = numberStreamController.stream;
    stream.transform(transformer).listen((event) {
      setState(() {
        lastNumber = event; // event sudah hasil transform (value*10)
      });
    }).onError((error) {
      // fallback kalau masih ada error
      setState(() {
        lastNumber = -1;
      });
    });
  }

  // Praktikum 1: ubah warna background pakai ColorStream
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  // Masih sama seperti Praktikum 2:
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
        color: bgColor,
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
