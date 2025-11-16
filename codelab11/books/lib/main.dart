import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart'; 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo — GabrielBatavia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = "";
  bool loading = false;


  /*
  Future<http.Response> getData() {
    const String bookId = "junbDwAAQBAJ";
    return http.get(
      Uri.https("www.googleapis.com", "/books/v1/volumes/$bookId"),
    );
  }

  void _onGoPressed() {
    ...
  }
  */

  /*
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    setState(() {
      loading = true;
      result = "";
    });

    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      result = total.toString();
      loading = false;
    });
  }
  */




  late Completer completer;

  Future getNumber() {
    completer = Completer<int>(); // buat future secara manual
    calculate();                  // mulai proses async
    return completer.future;      // kembalikan future yang bisa ditunggu
  }

  // LANGKAH 5 — ganti method calculate() dengan try–catch
  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      // Uncomment untuk mengetes error:
      // throw Exception("Error test");

      completer.complete(42); // sukses
    } catch (_) {
      completer.completeError({}); // gagal → akan ditangkap catchError()
    }
  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Back from the Future")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text("GO!"),
              onPressed: () {
                setState(() {
                  loading = true;
                  result = "";
                });

                // LANGKAH 6 — pakai then + catchError
                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                    loading = false;
                  });
                }).catchError((e) {
                  setState(() {
                    result = "An error occurred";
                    loading = false;
                  });
                });
              },
            ),
            const SizedBox(height: 20),

            Text(result, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 20),

            if (loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
