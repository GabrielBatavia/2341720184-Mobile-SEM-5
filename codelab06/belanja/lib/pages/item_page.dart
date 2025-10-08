import 'package:flutter/material.dart';
import 'home_page.dart';

/// Helper: otomatis pilih Image.asset vs Image.network
Widget buildItemImage(
  String path, {
  double? height,
  double? width,
  BoxFit fit = BoxFit.cover,
}) {
  final isNetwork = path.startsWith('http');
  return isNetwork
      ? Image.network(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.broken_image, size: 64),
        )
      : Image.asset(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.broken_image, size: 64),
        );
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: const Text('Item Details'), elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'product-${item.name}',
                    child: buildItemImage(
                      // PAKAI field asset lokal (contoh: "img/nasigoreng.jpg")
                      item.imagePath,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Rp ${item.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            Text(' ${item.rating}'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Stock: ${item.stock}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Footer full width
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
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
