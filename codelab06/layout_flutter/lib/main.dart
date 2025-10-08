import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          /* soal 3*/
          Icon(Icons.star, color: Colors.red /* soal 4*/),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Kota **Batu** merupakan salah satu kota di **Provinsi Jawa Timur, Indonesia**. Terletak sekitar **15 kilometer di barat laut Kota Malang**, Batu dikenal luas sebagai **kota wisata** karena memiliki **udara yang sejuk** serta **pemandangan alam yang memukau**.Kota ini menawarkan berbagai **objek wisata menarik**, seperti taman rekreasi, kebun bunga, dan sejumlah tempat bersejarah. Selain itu, Batu juga terkenal sebagai **sentra produksi buah-buahan segar**, terutama **apel** dan **stroberi**, yang menjadi ikon khas kota ini',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Gabriel Batavia Xaverius 2341720184',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
            titleSection,
            buttonSection,
            textSection,
            Image.asset(
              '../img/batu.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}