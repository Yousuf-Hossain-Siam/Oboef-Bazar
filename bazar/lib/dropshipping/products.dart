import 'package:bazar/dropshipping/vendor_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class ResellerProducts extends StatelessWidget {
  const ResellerProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendors List'),
      ),
      body: ListView.builder(
        itemCount: vendorproducts.length,
        itemBuilder: (context, index) {
          final vendorName = vendorproducts.keys.toList()[index];
          return ListTile(
            title: Text(vendorName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorProducts(vendorName: vendorName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
