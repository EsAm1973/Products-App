import 'package:flutter/material.dart';
import 'package:practice/models/product.dart';
import 'package:practice/widgets/Handlefav.dart';
import 'package:rate/rate.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          Handlefav(
            product: widget.product,
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(
                widget.product.image ?? 'https://via.placeholder.com/300',
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.product.title ?? 'No Title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.description ?? 'No Description Available',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Rate(
                    iconSize: 30,
                    color: Colors.yellow.shade700,
                    allowHalf: true,
                    allowClear: true,
                    initialValue: widget.product.rate?.rate ?? 0.0,
                    readOnly: true,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.product.rate?.rate ?? 0.0}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '\$${widget.product.price ?? 0.0}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {},
                    child: const Text(
                      'Add To Cart',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}