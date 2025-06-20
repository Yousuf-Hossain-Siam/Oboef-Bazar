import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class vendormodel {
  final String id;
  final String logo;
  final String UserName;
  final String phonenumber;
  final String email;
  final String password;
  final String role;
  final String area;
  final String isapproveby;

  //Vendor
// 1.ID
// 2.User Name
// 3.Phone Number
// 4.Mail Address
// 5.Password
// 6.Role
// 7.Area
// 8.Vendor ID
// 9. is approve(by admin)
// 10. Vendor Logo
// 11.Product List(Product Model)
// 12. Reseller LIst(Reseller Model

  vendormodel({
    required this.id,
    required this.logo,
    required this.UserName,
    required this.phonenumber,
    required this.email,
    required this.password,
    required this.role,
    required this.area,
    required this.isapproveby,
  });
}

// Sample Product list
final List<vendormodel> vendors = [
  vendormodel(
    id: '1',
    UserName: 'Vendor 1',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '2',
    UserName: 'Vendor 2',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password2',
    role: 'Vendor',
    area: 'Area 2',
    isapproveby: 'Admin1',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '3',
    UserName: 'Vendor 3',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '4',
    UserName: 'Vendor 4',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '1',
    UserName: 'Vendor 1',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '2',
    UserName: 'Vendor 2',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password2',
    role: 'Vendor',
    area: 'Area 2',
    isapproveby: 'Admin1',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '3',
    UserName: 'Vendor 3',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '4',
    UserName: 'Vendor 4',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '1',
    UserName: 'Vendor 1',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '2',
    UserName: 'Vendor 2',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password2',
    role: 'Vendor',
    area: 'Area 2',
    isapproveby: 'Admin1',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '3',
    UserName: 'Vendor 3',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
  vendormodel(
    id: '4',
    UserName: 'Vendor 4',
    phonenumber: '1234567890',
    email: 'sM7H8@example.com',
    password: 'password1',
    role: 'Vendor',
    area: 'Area 1',
    isapproveby: 'Admin',
    logo: 'assets/images/baby_care.png',
  ),
];

// ignore: camel_case_types
class Approved_Vendorlist extends StatelessWidget {
  const Approved_Vendorlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vendors")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListView.builder(
                itemCount: vendors.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 22, 35, 81),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.blue,
                        )),
                    shadowColor: const Color.fromARGB(255, 22, 86, 0),
                    elevation: 4,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Vendor ID :${vendors[index].id}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
