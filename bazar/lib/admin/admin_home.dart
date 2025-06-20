import 'dart:async';

import 'package:bazar/admin/accepted_product.dart';
import 'package:bazar/admin/add_category.dart';

import 'package:bazar/admin/vendor_product_request.dart';
import 'package:bazar/admin/vendorlist.dart';
import 'package:bazar/admin/requested_reseller_list.dart';
import 'package:bazar/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
                child: const Text("A",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 15, 44, 58),
          title: Text(
            'Admin Home',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          centerTitle: true,
        ),
        drawer: drawer(context: context), // Assign the custom drawer
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptedProduct(),
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
                                    color: const Color.fromARGB(
                                        255, 177, 177, 177),
                                    offset: Offset(0, 2))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Accepted.png",
                                height: 60,
                                width: 60,
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 0.5,
                              ),
                              Center(
                                  child: Text(
                                "Accepted Product",
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
                            builder: (context) => Vendor_requestedProduct(),
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
                                    color: const Color.fromARGB(
                                        255, 177, 177, 177),
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
                                "Requested Product",
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
                            builder: (context) => Requested_Vendorlist(),
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
                                    color: const Color.fromARGB(
                                        255, 177, 177, 177),
                                    offset: Offset(0, 2))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/vendor.png",
                                height: 60,
                                width: 60,
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 0.5,
                              ),
                              Center(
                                  child: Text(
                                "Requested Vendor",
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
                                    color: const Color.fromARGB(
                                        255, 177, 177, 177),
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
                            builder: (context) => CategoryScreen(),
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
                                    color: const Color.fromARGB(
                                        255, 177, 177, 177),
                                    offset: Offset(0, 2))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/catagory.png",
                                height: 60,
                                width: 60,
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 0.5,
                              ),
                              Center(
                                  child: Text(
                                "Add Category",
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
            ),
          ],
        ));
  }
}

class drawer extends StatelessWidget {
  const drawer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginprovider, child) {
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
              accountName: Text(loginprovider.adminName.isNotEmpty
                  ? loginprovider.adminName
                  : "Unknown"),
              accountEmail: const Text('Admin@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Requested Product'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Vendor_requestedProduct(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: const Text('Accepted Product'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcceptedProduct(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list,
                  color: Color.fromARGB(255, 201, 151, 13)),
              title: const Text('Vendor List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Requested_Vendorlist(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.category,
                color: Color.fromARGB(255, 0, 146, 0),
              ),
              title: const Text('Add Category'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(),
                  ),
                );
              },
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
    });
  }
}
