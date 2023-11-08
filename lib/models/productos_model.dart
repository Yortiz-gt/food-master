class Category {
  Category(
      {required this.price,
      required this.name,
      required this.stock,
      required this.categoryName});

  final int? price;
  final String? name;
  final int? stock;
  final String? categoryName;

  factory Category.fromJson(Map<String, dynamic> json, String categoryName) {
    return Category(
      price: json["price"],
      name: json["name"],
      stock: json["stock"],
      categoryName: categoryName,
    );
  }

  Map<String, dynamic> toJson() => {
        "price": price,
        "name": name,
        "stock": stock,
      };
}
