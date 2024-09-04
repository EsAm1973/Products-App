import 'package:flutter/foundation.dart';
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: widget.product,
                              )))
                      .then((value) {
                    setState(() {});
                  });
                },
                child: Image.network(
                  widget.product.image!,
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
            widget.product.title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
