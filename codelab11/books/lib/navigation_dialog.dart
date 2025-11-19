import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  // warna awal background (boleh diganti lagi kalau mau)
  Color color = Colors.indigo.shade700;

  // Langkah 3: method async untuk menampilkan dialog
  Future<void> _showColorDialog(BuildContext context) async {
    await showDialog<Color>(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            // 3 warna favorit (Soal 17)
            TextButton(
              child: const Text('Indigo'),
              onPressed: () {
                color = Colors.indigo.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Teal'),
              onPressed: () {
                color = Colors.teal.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Deep Orange'),
              onPressed: () {
                color = Colors.deepOrange.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );

    // rebuild UI dengan warna baru
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        // Soal 17 / identitas: pakai nama panggilan
        title: const Text('Navigation Dialog Screen – Gabriel Batavia'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          // Langkah 4: panggil method async
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}
