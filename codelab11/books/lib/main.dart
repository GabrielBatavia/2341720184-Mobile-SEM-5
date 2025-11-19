import 'package:flutter/material.dart';
import 'geolocation.dart';  // import screen lokasi

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocation Demo — Gabriel Batavia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      
      home: const LocationScreen(),
    );
  }
}
