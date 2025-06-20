import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String productName;
  final String productDetails;
  final String picture1;
  final String picture2;
  final String picture3;
  final double vendorPrice;
  final double resellerPrice;
  final double mrp;
  final bool isApproved;
  final String vendorId;
  final String vendorName;
  final String resellerId;
  final String resellerName;
  final String vendorLogo;
  final String resellerLogo;
  final String category;

  Product({
    required this.id,
    required this.productName,
    required this.productDetails,
    required this.picture1,
    required this.picture2,
    required this.picture3,
    required this.vendorPrice,
    required this.resellerPrice,
    required this.mrp,
    required this.isApproved,
    required this.vendorId,
    required this.vendorName,
    required this.resellerId,
    required this.resellerName,
    required this.vendorLogo,
    required this.resellerLogo,
    required this.category,
  });
}

final List<String> image = [
  "assets/images/image 13.jpg",
  "assets/images/image 13.jpg",
  "assets/images/image 13.jpg",
];

final List<Product> products = [
  Product(
    id: '1',
    productName: 'Product 1',
    productDetails: 'This is the detail of product 1.',
    picture1: 'https://via.placeholder.com/150',
    picture2: 'https://via.placeholder.com/150',
    picture3: 'https://via.placeholder.com/150',
    vendorPrice: 50.0,
    resellerPrice: 60.0,
    mrp: 70.0,
    isApproved: true,
    vendorId: 'V1',
    vendorName: 'Vendor 1',
    resellerId: 'R1',
    resellerName: 'Reseller 1',
    vendorLogo: 'https://via.placeholder.com/50',
    resellerLogo: 'https://via.placeholder.com/50',
    category: 'Category 1',
  ),
  Product(
    id: '2',
    productName: 'Product 2',
    productDetails: 'This is the detail of product 2.',
    picture1: 'https://via.placeholder.com/150',
    picture2: 'https://via.placeholder.com/150',
    picture3: 'https://via.placeholder.com/150',
    vendorPrice: 40.0,
    resellerPrice: 50.0,
    mrp: 60.0,
    isApproved: true,
    vendorId: 'V2',
    vendorName: 'Vendor 2',
    resellerId: 'R2',
    resellerName: 'Reseller 2',
    vendorLogo: 'https://via.placeholder.com/50',
    resellerLogo: 'https://via.placeholder.com/50',
    category: 'Category 2',
  ),
];

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image[0]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Container(
                        width: 700,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 45),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    )
                                  ]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Details",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    "ID: ${products[0].id}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "Vendor Price: \$${products[0].vendorPrice}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "Reseller Price: \$${products[0].resellerPrice}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "MRP: \$${products[0].mrp}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "Approved: ${products[0].isApproved ? "Yes" : "No"}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "Category: ${products[0].category}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, top: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(image[0]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(image[0]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(image[0]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
