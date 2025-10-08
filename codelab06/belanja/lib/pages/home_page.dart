import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class Item {
  final String name;
  final int price;
  final String imagePath; // ganti nama biar jelas asset
  final int stock;
  final double rating;
  final String link;

  Item({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.stock,
    required this.rating,
    required this.link,
  });
}

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Nasi Goreng',
      price: 18000,
      imagePath: 'img/nasigoreng.jpg',
      stock: 40,
      rating: 4.7,
      link: 'https://id.wikipedia.org/wiki/Nasi_goreng',
    ),
    Item(
      name: 'Rendang',
      price: 35000,
      imagePath: 'img/rendang.jpg',
      stock: 25,
      rating: 4.9,
      link: 'https://id.wikipedia.org/wiki/Rendang',
    ),
    Item(
      name: 'Sate Ayam',
      price: 22000,
      imagePath: 'img/sateayam.jpg',
      stock: 60,
      rating: 4.6,
      link: 'https://id.wikipedia.org/wiki/Sate',
    ),
    Item(
      name: 'Bakso',
      price: 15000,
      imagePath: 'img/bakso.jpg',
      stock: 70,
      rating: 4.5,
      link: 'https://id.wikipedia.org/wiki/Bakso',
    ),
    Item(
      name: 'Gado-Gado',
      price: 16000,
      imagePath: 'img/Gado.jpg',
      stock: 35,
      rating: 4.4,
      link: 'https://id.wikipedia.org/wiki/Gado-gado',
    ),
    Item(
      name: 'Soto Ayam',
      price: 17000,
      imagePath: 'img/soto.jpg',
      stock: 50,
      rating: 4.6,
      link: 'https://id.wikipedia.org/wiki/Soto',
    ),
  ];


  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List'), elevation: 0),

      // body cukup GridView saja (tanpa footer di dalam Column)
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductCard(
            item: items[index],
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: items[index]);
            },
          );
        },
      ),

      // Footer full width
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          width: double.infinity, // penting agar full
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Colors.blue,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Gabriel Batavia Xaverius',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text('2341720184', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}