// lib/widget/filter_carousel.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'filter_selector.dart';

class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key, required this.imageBytes});
  final Uint8List imageBytes;

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (i) => Colors.primaries[(i * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color v) => _filterColor.value = v;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Filter Carousel')),
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(child: _buildPhotoWithFilter()),
            Positioned(
              left: 0, right: 0, bottom: 0,
              child: FilterSelector(
                filters: _filters,
                onFilterChanged: _onFilterChanged,
                imageBytes: widget.imageBytes, // untuk thumbnail
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, _) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(color.withOpacity(0.5), BlendMode.color),
          child: Image.memory(widget.imageBytes, fit: BoxFit.cover),
        );
      },
    );
  }
}
