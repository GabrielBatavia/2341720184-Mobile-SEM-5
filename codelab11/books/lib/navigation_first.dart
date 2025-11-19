import 'package:flutter/material.dart';
import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // warna awal (boleh diganti jadi warna favoritmu)
  Color color = Colors.indigo;

  // Langkah 3: function async untuk navigate + ambil color
  Future<void> _navigateAndGetColor(BuildContext context) async {
    final selectedColor = await Navigator.push<Color>(
      context,
      MaterialPageRoute(
        builder: (context) => const NavigationSecond(),
      ),
    );

    setState(() {
      // jika user tidak memilih apa-apa, fallback ke indigo
      color = selectedColor ?? Colors.indigo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Soal 15: nama panggilan di title
        title: const Text('Navigation First – Gabriel Batavia'),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: color,
        child: Center(
          child: ElevatedButton(
            onPressed: () => _navigateAndGetColor(context),
            child: const Text('Pilih Warna'),
          ),
        ),
      ),
    );
  }
}
