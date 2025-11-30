class Pizza {
  // Praktikum 3: Konstanta nama key JSON
  static const String keyId = 'id';
  static const String keyName = 'pizzaName';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyImage = 'imageUrl';

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

  /// fromJson() dengan konstanta + handling error praktikum 2
  factory Pizza.fromJson(Map<String, dynamic> json) {
    // int.tryParse + ?? 0 untuk id
    final int parsedId =
        int.tryParse(json[keyId].toString()) ?? 0;

    // toString + ternary supaya tidak menampilkan "null"
    final String parsedName = json[keyName] != null
        ? json[keyName].toString()
        : 'No name';

    final String parsedDescription = json[keyDescription] != null
        ? json[keyDescription].toString()
        : '';

    // double.tryParse + ?? 0.0 untuk price
    final double parsedPrice =
        double.tryParse(json[keyPrice].toString()) ?? 0.0;

    // null coalescing untuk imageUrl
    final String parsedImageUrl =
        (json[keyImage] ?? '').toString();

    return Pizza(
      id: parsedId,
      pizzaName: parsedName,
      description: parsedDescription,
      price: parsedPrice,
      imageUrl: parsedImageUrl,
    );
  }

  /// toJson() dengan konstanta key
  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
