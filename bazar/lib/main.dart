// ignore_for_file: unused_import

import 'package:bazar/admin/accepted_product.dart';
import 'package:bazar/admin/admin_home.dart';
import 'package:bazar/admin/Register.dart';
import 'package:bazar/admin/login.dart';
import 'package:bazar/dropshipping/dropshipping_home.dart';
import 'package:bazar/dropshipping/reseller_login.dart';
import 'package:bazar/providers/accepted_products_provider.dart';
import 'package:bazar/providers/login_provider.dart';
import 'package:bazar/providers/vendor_productR.dart';
import 'package:bazar/users/cart/cart_page.dart';
import 'package:bazar/providers/cart_provider.dart';
import 'package:bazar/users/elements/home2.dart';
import 'package:bazar/users/elements/login_page.dart';
import 'package:bazar/users/elements/product_full_descrip.dart';
import 'package:bazar/users/home.dart';
import 'package:bazar/vendor/demotest.dart';
import 'package:bazar/vendor/products.dart';
import 'package:bazar/vendor/products_list.dart';
import 'package:bazar/vendor/vendor_home.dart';
import 'package:bazar/vendor/vendor_login.dart';
import 'package:bazar/vendor/vendor_registration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AcceptedProductsProvider()),
        ChangeNotifierProvider(create: (context) => Vendor_ProductsR()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/homepage',
  routes: [
    GoRoute(
      path: '/homepage',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => AdminHome(),
    ),
    GoRoute(
      path: '/vendor',
      builder: (context, state) => VendorHome(),
    ),
    GoRoute(
      path: '/dropshipping',
      builder: (context, state) => DropshippingHome(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
