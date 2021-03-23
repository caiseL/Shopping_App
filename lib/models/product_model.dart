import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.available,
    this.images,
    this.description,
    this.price,
    this.colors,
    this.sizes,
  });

  String id;
  String title;
  int available;
  List<dynamic> images;
  //String rating;
  String description;
  double price;
  List<String> colors;
  List<String> sizes;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        available: json["available"],
        images: json["images"],
        description: json["description"],
        price: json["price"] / 1,
        colors: json["colors"],
        sizes: json["sizes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "available": available,
        "images": images,
        "description": description,
        "price": price,
        "colors": colors,
        "sizes": sizes,
      };
}
