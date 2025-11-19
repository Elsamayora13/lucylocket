import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) =>
    List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int price;
  String description;
  String category;
  String thumbnail;
  bool isFeatured;
  int stock;
  String color;
  int userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    this.thumbnail = "",
    required this.isFeatured,
    required this.stock,
    this.color = "",
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        thumbnail: json["thumbnail"] ?? "",
        isFeatured: json["is_featured"] ?? false,
        stock: json["stock"] ?? 0,
        color: json["color"] ?? "",
        userId: json["user_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "stock": stock,
        "color": color,
        "user_id": userId,
      };
}
