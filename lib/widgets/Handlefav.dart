import 'package:flutter/material.dart';
import 'package:practice/Screens/favourite.dart';
import 'package:practice/helpers/db_helper.dart';
import 'package:practice/models/product.dart';

class Handlefav extends StatefulWidget {
  final Product product;
  Handlefav({super.key, required this.product});

  @override
  State<Handlefav> createState() => _HandlefavState();
}

class _HandlefavState extends State<Handlefav> {
  @override
  Widget build(BuildContext context) {
    return ProductProvider.instance.isfavourite[widget.product.id!] == true
        ? IconButton(
            onPressed: () async {
              productProvider.deleteproduct(widget.product.id!).then(
                (value) {
                  productProvider.isfavourite[widget.product.id!] = false;
                },
              );
              setState(() {});
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ))
        : IconButton(
            onPressed: () async {
              await productProvider.insert(widget.product).then(
                (value) {
                  productProvider.isfavourite[widget.product.id!] = true;
                },
              );
              setState(() {});
            },
            icon: const Icon(
              Icons.favorite,
              size: 20,
              color: Colors.white,
            ));
  }
}
