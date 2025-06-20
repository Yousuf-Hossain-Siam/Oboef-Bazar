//Vendor Register with Details
// Vendor Login with User name and Password
// In here vendor can see all the product list with product model and add the product
// In here vendor can see all the reseller list and it will approve by admin

import 'dart:async';

import 'package:bazar/admin/accepted_product.dart';
import 'package:bazar/admin/add_category.dart';

import 'package:bazar/admin/vendor_product_request.dart';
import 'package:bazar/admin/vendorlist.dart';
import 'package:bazar/admin/requested_reseller_list.dart';
import 'package:bazar/vendor/add_product.dart';
import 'package:bazar/vendor/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class VendorHome extends StatefulWidget {
  const VendorHome({super.key});

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, // Assign the key to Scaffold
        appBar: AppBar(
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState
                    ?.openDrawer(); // Use the key to open the drawer
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: const Text("V",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 15, 44, 58),
          title: Text(
            'Vendor Home',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          centerTitle: true,
        ),
        drawer: _buildCustomDrawer(context), // Assign the custom drawer
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(227, 223, 194, 0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: const Color.fromARGB(255, 177, 177, 177),
                        offset: Offset(0, 2))
                  ]),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    color: const Color.fromARGB(255, 75, 75, 75), fontSize: 20),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //2nd item row
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsList(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 15, 44, 58),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color:
                                      const Color.fromARGB(255, 177, 177, 177),
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/requested.png",
                              height: 60,
                              width: 60,
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 0.5,
                            ),
                            Center(
                                child: Text(
                              "Product List",
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),

                  //4th item
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Requested_ResellerList(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 15, 44, 58),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color:
                                      const Color.fromARGB(255, 177, 177, 177),
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/reseller.png",
                              height: 60,
                              width: 60,
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 0.5,
                            ),
                            Center(
                                child: Text(
                              "Requested Reseller",
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProduct(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 15, 44, 58),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color:
                                      const Color.fromARGB(255, 177, 177, 177),
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/add-to-cart.png",
                              height: 60,
                              width: 60,
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 0.5,
                            ),
                            Center(
                                child: Text(
                              "Add Product",
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildCustomDrawer(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 2),
                  color: Color.fromARGB(255, 164, 164, 164),
                )
              ],
              color: Color.fromARGB(255, 15, 44, 58),
            ),
            accountName: const Text('Vendor Name'),
            accountEmail: const Text('Vendor@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'A',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Color.fromARGB(255, 2, 17, 95),
            ),
            title: const Text('Change password'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Container(
                        child: AlertDialog(
                          title: const Text('Update Password'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Curent Password',
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'New Password',
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Confirm Password',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            CupertinoButton(
                              sizeStyle: CupertinoButtonSize.small,
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            CupertinoButton(
                              sizeStyle: CupertinoButtonSize.small,
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Update',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.manage_accounts,
              color: Colors.blue,
            ),
            title: const Text('Update Profile'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Container(
                        child: AlertDialog(
                          title: const Text('Update Profile'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Phone',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            CupertinoButton(
                              sizeStyle: CupertinoButtonSize.small,
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            CupertinoButton(
                              sizeStyle: CupertinoButtonSize.small,
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Update',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Add logout functionality here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
