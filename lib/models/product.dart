// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;
  final Rateing? rate;
  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rate: Rateing.fromJson(json['rating']),
    );
  }
  factory Product.fromMap(Map<String, dynamic> Map) {
    return Product(id: Map["id"], title: Map["title"], image: Map["image"]);
  }
  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "image": image};
  }
}

class Rateing {
  final double rate;
  final int count;
  Rateing({
    required this.rate,
    required this.count,
  });

  factory Rateing.fromJson(Map<String, dynamic> json) {
    return Rateing(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
