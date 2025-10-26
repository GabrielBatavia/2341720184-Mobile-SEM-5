// lib/main.dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'widget/takepicture_screen.dart';     // Praktikum 1 (kamera)
// import 'widget/filter_carousel.dart';     // Tidak dipanggil langsung; tetap boleh diimport kalau perlu

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(firstCamera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.firstCamera});
  final CameraDescription firstCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeMenu(firstCamera: firstCamera),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key, required this.firstCamera});
  final CameraDescription firstCamera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum 1 & 2')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('Praktikum 1: Kamera'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TakePictureScreen(camera: firstCamera),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.palette),
                label: const Text('Praktikum 2: Photo Filter Carousel'),
                onPressed: () {
                  // Alur praktikum 2: ambil foto dulu, lalu filter di layar berikutnya
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TakePictureScreen(camera: firstCamera),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
