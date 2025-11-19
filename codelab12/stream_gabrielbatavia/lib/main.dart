// lib/main.dart
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
      // Soal 1: tambahkan nama panggilan pada title
      title: 'Stream — Gabriel Batavia',
      // Soal 1: ganti warna tema sesuai kesukaan (contoh: indigo)
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
  // Langkah 8: variabel background color & ColorStream
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  @override
  void initState() {
    super.initState();
    // Langkah 10: inisialisasi ColorStream & panggil changeColor
    colorStream = ColorStream();
    changeColor();
  }

  // Langkah 9 + 13: method changeColor versi listen()
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Biar kelihatan juga di AppBar
        title: const Text('Stream — Gabriel Batavia'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
      ),
    );
  }
}
