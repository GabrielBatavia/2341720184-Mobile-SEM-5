import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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

  @override
  void initState() {
    super.initState();
    _loadPizzas();
  }

  Future<void> _loadPizzas() async {
    final pizzas = await readJsonData();
    setState(() {
      _pizzas = pizzas;
    });
  }

  /// Baca JSON dari assets dan konversi ke List<Pizza>
  Future<List<Pizza>> readJsonData() async {
    final String jsonString =
        await rootBundle.loadString('assets/pizzalist.json');

    final List<dynamic> jsonList = jsonDecode(jsonString);

    final List<Pizza> pizzas = jsonList
        .map((item) => Pizza.fromJson(item as Map<String, dynamic>))
        .toList();

    // Contoh: konversi satu objek Pizza kembali ke JSON String
    if (pizzas.isNotEmpty) {
      final Map<String, dynamic> map = pizzas.first.toJson();
      final String jsonStr = jsonEncode(map);
      debugPrint('Contoh 1 Pizza ke JSON: $jsonStr');
    }

    return pizzas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: _pizzas.isEmpty
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
    );
  }
}