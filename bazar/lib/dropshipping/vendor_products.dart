import 'package:bazar/admin/vendorlist.dart';
import 'package:bazar/dropshipping/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/image_carousel_slider.dart';

// Your Product model
class Product {
  final List<String> images;
  final String name;
  final double price;
  final String description;

  Product({
    required this.images,
    required this.name,
    required this.price,
    required this.description,
  });
}

final Map<String, List<Product>> vendorproducts = {
  "Vendor1": [
    Product(
      images: [
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
      ],
      name: 'Product 1',
      price: 29.99,
      description: 'This is a description of Product 1.',
    ),
    Product(
      images: [
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
      ],
      name: 'Product 1',
      price: 29.99,
      description: 'This is a description of Product 1.',
    ),
    Product(
      images: [
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
      ],
      name: 'Product 1',
      price: 29.99,
      description: 'This is a description of Product 1.',
    ),
    Product(
      images: [
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
      ],
      name: 'Product 1',
      price: 29.99,
      description: 'This is a description of Product 1.',
    ),
  ],
  "Vendor2": [
    Product(
      images: [
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
      ],
      name: 'Product 1',
      price: 29.99,
      description: 'This is a description of Product 1.',
    ),
    Product(
      images: [
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
        'assets/images/image 13.jpg',
      ],
      name: 'Product 1',
      price: 29.99,
      description: 'This is a description of Product 1.',
    ),
  ]
};

class VendorProducts extends StatelessWidget {
  final String vendorName;

  const VendorProducts({required this.vendorName, super.key});

  @override
  Widget build(BuildContext context) {
    final products = vendorproducts[vendorName]!;

    return Scaffold(
      appBar: AppBar(
        title: Text("$vendorName Products"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: vendorproducts[vendorName]!.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          product.images[0],
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Product Name
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Product Price
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Product Description
                      Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(vendorName),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {},
                            child: const Text('Add to Cart'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
