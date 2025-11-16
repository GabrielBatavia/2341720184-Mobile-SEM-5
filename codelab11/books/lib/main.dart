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
  */

  /*
  // Praktikum 2
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
  */

  /*
  // Praktikum 3 Completer
  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }
  */



  // Re-activate function dari praktikum 2 (dibutuhkan oleh FutureGroup)
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

  // Langkah 1 — FutureGroup
  void returnFG() {
    setState(() {
      loading = true;
      result = "";
    });

    FutureGroup<int> futureGroup = FutureGroup<int>();

    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();

    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString(); // hasil = 6
        loading = false;
      });
    });
  }

  // Langkah 4 — Future.wait
  void returnWait() async {
    setState(() {
      loading = true;
      result = "";
    });

    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    final value = await futures; // value = [1,2,3]

    int total = value.fold(0, (sum, item) => sum + item);

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
                // Ubah sesuai langkah 2:
                returnFG(); // atau returnWait() untuk langkah 4
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
