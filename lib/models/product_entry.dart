// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int price;
  String category;
  String? thumbnail;
  int stok;
  String description;
  bool isFeatured;
  int? userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.thumbnail,
    required this.stok,
    required this.description,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    stok: json["stok"],
    description: json["description"],
    isFeatured: json["is_featured"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "category": category,
    "thumbnail": thumbnail,
    "stok": stok,
    "description": description,
    "is_featured": isFeatured,
    "user_id": userId,
  };
}