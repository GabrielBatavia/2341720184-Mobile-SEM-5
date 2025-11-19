import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Soal 15: nama panggilan di title
        title: const Text('Navigation Second – Gabriel Batavia'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Pilih warna background:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // 3 warna favorit (boleh kamu ganti)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              onPressed: () {
                Navigator.pop(context, Colors.indigo);
              },
              child: const Text('Indigo'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                Navigator.pop(context, Colors.teal);
              },
              child: const Text('Teal'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              onPressed: () {
                Navigator.pop(context, Colors.deepOrange);
              },
              child: const Text('Deep Orange'),
            ),
          ],
        ),
      ),
    );
  }
}
