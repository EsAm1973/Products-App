import 'package:flutter/material.dart';
import 'package:practice/Screens/details_screen.dart';
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
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(children: [
                              InkWell(
                                  onTap: () {
                                    if (product.image != null &&
                                        product.title != null) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
                                                    product: product,
                                                  )))
                                          .then((value) {
                                        setState(() {});
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Product data is incomplete')),
                                      );
                                    }
                                  },
                                  child: Image.network(
                                    product.image ??
                                        'https://via.placeholder.com/150',
                                    width: 150,
                                    height: 150,
                                  )),
                              Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                      onPressed: () async {
                                        await productProvider
                                            .deleteproduct(product.id!)
                                            .then(
                                          (value) {
                                            ProductProvider()
                                                    .isfavourite[product.id!] =
                                                false;
                                          },
                                        );
                                        setState(() {
                                          productProvider.isfavourite
                                              .remove(product.id!);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )))
                            ]),
                            Text(
                              product.title ?? 'No Title',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }));
  }
}
