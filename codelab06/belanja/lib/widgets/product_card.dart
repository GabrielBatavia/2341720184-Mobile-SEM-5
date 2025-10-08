import 'package:flutter/material.dart';
import '../pages/home_page.dart';

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
              const Icon(Icons.broken_image, size: 48),
        )
      : Image.asset(
          path,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.broken_image, size: 48),
        );
}

class ProductCard extends StatelessWidget {
  final Item item;
  final Function() onTap;

  const ProductCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product-${item.name}',
              child: buildItemImage(
                // PAKAI field asset lokal (contoh: "img/rendang.jpg")
                item.imagePath,
                height: 140,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${item.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      Text(' ${item.rating}'),
                      const Spacer(),
                      Text('Stok: ${item.stock}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
