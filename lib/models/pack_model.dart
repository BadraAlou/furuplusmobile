class Pack {
  final int id;
  final String name;
  final String description;
  //final double price;
  final String price;
  final String image;

  Pack({required this.id, required this.name, required this.description, required this.price, required this.image});

  factory Pack.fromJson(Map<String, dynamic> json) {
    return Pack(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      //price: json['price'].toDouble() ?? '',
      price: json['price'],
      image: json['image'] ?? '',
    );
  }
}