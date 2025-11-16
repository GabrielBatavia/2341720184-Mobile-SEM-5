import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo — GabrielBatavia',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
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
  String result = '';
  bool loading = false;

  // PILIH SALAH SATU: id atau query (keduanya valid)
  Future<http.Response> getData() {
    // 1) By volume id (valid)
    // return http.get(Uri.https('www.googleapis.com', '/books/v1/volumes/gZ-1DwAAQBAJ'));

    // 2) By search query (juga valid)
    return http.get(Uri.https('www.googleapis.com', '/books/v1/volumes', {
      'q': 'intitle:What If Jesus Was Serious',
      'maxResults': '1',
    }));
  }

  void _onGoPressed() {
    setState(() {
      loading = true;
      result = '';
    });

    getData()
        .then((resp) {
          setState(() {
            if (resp.statusCode == 200) {
              final body = resp.body;
              result = body.substring(0, body.length < 450 ? body.length : 450);
            } else {
              result = 'HTTP ${resp.statusCode}: ${resp.reasonPhrase ?? 'Unknown'}';
            }
          });
        })
        .catchError((e) {
          setState(() {
            result = 'Network/CORS error: $e';
          });
        })
        .whenComplete(() => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: _onGoPressed, child: const Text('GO!')),
            const SizedBox(height: 12),
            Text(result),
            const SizedBox(height: 12),
            if (loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
