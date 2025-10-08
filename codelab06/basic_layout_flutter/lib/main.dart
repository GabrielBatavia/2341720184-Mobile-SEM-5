import 'package:flutter/material.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Showcase',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget buildProfileHeader() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 220,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/profile.png'),
          radius: 70,
        ),
        Positioned(
          bottom: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Gabriel Batavia',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildInfoCard() {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.home, color: Colors.indigo),
            title: Text('742 Evergreen Terrace'),
            subtitle: Text('Springfield, USA'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.indigo),
            title: Text('+1 (555) 123-4567'),
          ),
          ListTile(
            leading: Icon(Icons.email, color: Colors.indigo),
            title: Text('alex.j@example.com'),
          ),
        ],
      ),
    );
  }

  Widget buildFavoritePlaces() {
    final places = [
      {'name': 'Sunset Diner', 'icon': Icons.restaurant},
      {'name': 'Majestic Cinema', 'icon': Icons.movie},
      {'name': 'Blue Bird Café', 'icon': Icons.local_cafe},
      {'name': 'Harmony Park', 'icon': Icons.park},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Favorite Spots',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return ListTile(
              leading: Icon(place['icon'] as IconData, color: Colors.blueAccent),
              title: Text(place['name'] as String),
            );
          },
        ),
      ],
    );
  }

  Widget buildPhotoGallery() {
    final imagePaths = [
      'assets/gallery_0.jpg',
      'assets/gallery_1.jpg',
      'assets/gallery_2.jpg',
      'assets/gallery_3.jpg',
      'assets/gallery_4.jpg',
      'assets/gallery_5.jpg',
      'assets/gallery_6.jpg',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: Icon(Icons.error, color: Colors.red)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Layout Example')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileHeader(),
            buildInfoCard(),
            const Divider(thickness: 2),
            buildFavoritePlaces(),
            const Divider(thickness: 2),
            buildPhotoGallery(),
          ],
        ),
      ),
    );
  }
}
