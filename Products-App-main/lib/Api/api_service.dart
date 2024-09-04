import 'dart:convert';
import 'package:practice/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const apiUrl = 'https://fakestoreapi.com/products/';
  static Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      print(response.body);
      return jsonList.map((element) => Product.fromJson(element)).toList();
    } else {
      throw Exception('Faild to load products');
    }
  }
}
