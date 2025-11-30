import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart'; // Langkah 3

import 'pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Dart ↔ JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> _pizzas = [];

  // Langkah 4: tambahkan variabel appCounter
  int _appCounter = 0;

  @override
  void initState() {
    super.initState();
    _loadPizzas();
    _readAndWritePreference(); // Langkah 10: panggil di initState
  }

  // Fungsi untuk baca JSON dari assets dan konversi ke List<Pizza>
  Future<void> _loadPizzas() async {
    final String jsonString =
        await rootBundle.loadString('assets/pizzalist.json');

    final List<dynamic> jsonList = jsonDecode(jsonString);

    final List<Pizza> pizzas = jsonList
        .map((item) => Pizza.fromJson(item as Map<String, dynamic>))
        .toList();

    setState(() {
      _pizzas = pizzas;
    });

    // contoh encode balik 1 objek ke JSON
    if (pizzas.isNotEmpty) {
      final map = pizzas.first.toJson();
      final jsonStr = jsonEncode(map);
      debugPrint('Contoh Pizza ke JSON: $jsonStr');
    }
  }

  // Langkah 5–8: method async readAndWritePreference()
  Future<void> _readAndWritePreference() async {
    // Langkah 6: dapatkan instance SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Langkah 7: baca, cek null, dan increment counter
    int counter = prefs.getInt('appCounter') ?? 0;
    counter++;

    // Langkah 8: simpan nilai baru
    await prefs.setInt('appCounter', counter);

    // Langkah 9: perbarui state
    setState(() {
      _appCounter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: Column(
        children: [
          // Tampilkan berapa kali app dibuka
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'App dibuka $_appCounter kali',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: _pizzas.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _pizzas.length,
                    itemBuilder: (context, index) {
                      final pizza = _pizzas[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(pizza.id.toString()),
                        ),
                        title: Text(pizza.pizzaName),
                        subtitle: Text(
                          '${pizza.description.isEmpty ? '(no description)' : pizza.description}\n'
                          '€ ${pizza.price.toStringAsFixed(2)}',
                        ),
                        isThreeLine: true,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
