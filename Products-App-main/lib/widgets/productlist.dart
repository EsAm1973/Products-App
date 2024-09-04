import 'package:flutter/material.dart';
import 'package:practice/Screens/details_screen.dart';
import 'package:practice/models/product.dart';
import 'package:practice/widgets/Handlefav.dart';

class Productlist extends StatefulWidget {
  final Product product;
  const Productlist({super.key, required this.product});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
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
                  child: Container(
                    child: Image.network(
                      widget.product.image!,
                      width: 150,
                      height: 150,
                    ),
                  )),
              Positioned(
                  top: 8, right: 8, child: Handlefav(product: widget.product))
            ]),
            Text(
              widget.product.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
