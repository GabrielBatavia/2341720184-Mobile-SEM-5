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

  Future<http.Response> getData() {
    const String bookId = "junbDwAAQBAJ";
    return http.get(
      Uri.https("www.googleapis.com", "/books/v1/volumes/$bookId"),
    );
  }

  /*
  void _onGoPressed() {
    setState(() {
      loading = true;
      result = "";
    });

    getData()
        .then((resp) {
          if (resp.statusCode == 200) {
            final body = resp.body;
            final snippet =
                body.substring(0, body.length < 450 ? body.length : 450);
            setState(() {
              result = snippet;
            });
          } else {
            setState(() {
              result =
                  "HTTP ${resp.statusCode}: ${resp.reasonPhrase ?? 'Unknown'}";
            });
          }
        })
        .catchError((e) {
          setState(() {
            result = "Network error: $e";
          });
        })
        .whenComplete(() {
          setState(() => loading = false);
        });
  }
  */


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
                count();
              },
            ),
            const SizedBox(height: 16),
            Text(result, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            if (loading) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
