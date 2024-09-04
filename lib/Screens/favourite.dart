import 'package:flutter/material.dart';
import 'package:practice/helpers/db_helper.dart';
import 'package:practice/models/product.dart';
import 'package:practice/widgets/favlist.dart';

class Favourite extends StatefulWidget {
  Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

ProductProvider productProvider = ProductProvider();

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favourite',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: ProductProvider().getproduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Failed to load products'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No products available'),
                );
              } else {
                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      Product product = snapshot.data![index];
                      return Favlist(product: product);
                    });
              }
            }));
  }
}