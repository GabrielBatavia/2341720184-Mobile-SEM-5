import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // Langkah 2: variabel Future
  late Future<Position> _positionFuture;

  // Langkah 1: method getPosition() (tanpa setState, hanya return Future)
  Future<Position> getPosition() async {
    // (boleh ada delay kalau mau kelihatan loading)
    await Future.delayed(const Duration(seconds: 3));

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('GPS tidak aktif');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Izin lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Izin lokasi ditolak permanen');
    }

    // ambil posisi
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  // Langkah 3: initState set future
  @override
  void initState() {
    super.initState();
    _positionFuture = getPosition();
  }

  // Langkah 4 + 5: build dengan FutureBuilder + handling error
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Soal 11: pakai nama panggilan
        title: const Text('Current Location – Gabriel Batavia'),
      ),
      body: Center(
        child: FutureBuilder<Position>(
          future: _positionFuture,
          builder: (context, snapshot) {
            // masih menunggu → tampilkan loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            // selesai
            else if (snapshot.connectionState == ConnectionState.done) {
              // Langkah 5: handling error
              if (snapshot.hasError) {
                return const Text('Something terrible happened!');
              }

              if (snapshot.hasData) {
                final pos = snapshot.data!;
                final posText =
                    'Latitude : ${pos.latitude} - Longitude : ${pos.longitude}';
                return Text(
                  posText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                );
              } else {
                return const Text('Tidak ada data lokasi.');
              }
            }

            // state lain (jarang terjadi)
            return Text('State: ${snapshot.connectionState}');
          },
        ),
      ),
    );
  }
}
