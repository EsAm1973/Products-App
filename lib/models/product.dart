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
      price: json['price']?.toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rate: Rateing.fromJson(json['rating']),
    );
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      title: map["title"],
      image: map["image"],
      price: map["price"]?.toDouble(),
      description: map["description"],
      category: map["category"],
      rate: map["rating_rate"] != null && map["rating_count"] != null
          ? Rateing(
              rate: map["rating_rate"]?.toDouble() ?? 0.0,
              count: map["rating_count"] ?? 0,
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "price": price,
      "description": description,
      "category": category,
      "rating_rate": rate?.rate,
      "rating_count": rate?.count
    };
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
