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

  // -------------------------------------------------------
  // PRAKTIKUM 5 — returnError()
  // -------------------------------------------------------
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  // -------------------------------------------------------
  // PRAKTIKUM 5 — handleError()
  // -------------------------------------------------------
  Future handleError() async {
    setState(() {
      loading = true;
      result = "";
    });

    try {
      await returnError(); // ini akan melempar error
    } catch (error) {
      setState(() {
        result = error.toString();   // tampilkan error langsung ke UI
      });
    } finally {
      print('Complete');             // selalu tampil di debug console
      setState(() {
        loading = false;
      });
    }
  }

  // -------------------------------------------------------
  // UI
  // -------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Back from the Future")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text("Go!"),
              onPressed: () {
                handleError(); // Panggil method error handling
              },
            ),

            const SizedBox(height: 20),

            Text(
              result,
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            if (loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
