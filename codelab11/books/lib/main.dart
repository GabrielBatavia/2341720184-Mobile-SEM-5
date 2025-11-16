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


  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }


  Future handleError() async {
    setState(() {
      loading = true;
      result = "";
    });

    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();     // tampilkan pesan error ke UI
      });
    } finally {
      print('Complete');               // selalu muncul di debug console
      setState(() {
        loading = false;
      });
    }
  }

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
                handleError();   // panggil method baru
              },
            ),

            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 22)),

            const SizedBox(height: 20),
            if (loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
