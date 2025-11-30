class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  /// Praktikum 2: handle data JSON yang tidak konsisten
  factory Pizza.fromJson(Map<String, dynamic> json) {
    // Langkah 3: int.tryParse + ?? 0 untuk id
    final int parsedId = int.tryParse(json['id'].toString()) ?? 0;

    // Langkah 5 + 6 + 10:
    //  - gunakan toString()
    //  - operator ternary supaya tidak menampilkan "null" ke user
    final String parsedName = json['pizzaName'] != null
        ? json['pizzaName'].toString()
        : 'No name';

    final String parsedDescription = json['description'] != null
        ? json['description'].toString()
        : '';

    // Langkah 7 + 8: double.tryParse + ?? 0 untuk price
    final double parsedPrice =
        double.tryParse(json['price'].toString()) ?? 0.0;

    // Langkah 4 + 5: null coalescing untuk String (imageUrl)
    final String parsedImageUrl = (json['imageUrl'] ?? '').toString();

    return Pizza(
      id: parsedId,
      pizzaName: parsedName,
      description: parsedDescription,
      price: parsedPrice,
      imageUrl: parsedImageUrl,
    );
  }

  /// (Dari praktikum 1) Konversi kembali ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
