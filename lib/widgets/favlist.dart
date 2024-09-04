
import 'package:flutter/material.dart';
import 'package:practice/Screens/details_screen.dart';
import 'package:practice/Screens/favourite.dart';
import 'package:practice/helpers/db_helper.dart';
import 'package:practice/models/product.dart';

class Favlist extends StatefulWidget {
  final Product product;
  const Favlist({super.key, required this.product});

  @override
  State<Favlist> createState() => _FavlistState();
}

class _FavlistState extends State<Favlist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(children: [
            InkWell(
                onTap: () {
                  if (widget.product.image != null && widget.product.title != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  product: widget.product,
                                )))
                        .then((value) {
                      setState(() {});
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product data is incomplete')),
                    );
                  }
                },
                child: Image.network(
                  widget.product.image ?? 'https://via.placeholder.com/150',
                  width: 150,
                  height: 150,
                )),
            Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                    onPressed: () async {
                      await productProvider
                          .deleteproduct(widget.product.id!)
                          .then(
                        (value) {
                          ProductProvider().isfavourite[widget.product.id!] =
                              false;
                        },
                      );
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )))
          ]),
          Text(
            widget.product.title ?? 'No Title',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}