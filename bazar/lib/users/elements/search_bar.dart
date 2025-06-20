import 'package:bazar/dropshipping/reseller_login.dart';
import 'package:bazar/users/cart/cart_page.dart';
import 'package:bazar/providers/cart_provider.dart';
import 'package:bazar/vendor/vendor_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});

  @override
  State<Search_Bar> createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmpty = true;
  String _selectedCategory = "All Categories";

  final List<String> _categories = [
    "All Categories",
    "Medicine",
    "Cosmetics",
    "Home Appliance",
    "Baby Care",
    "Homemade Food",
    "Grocery",
    "Toiletries",
    "Fashion",
    "Male Fashion",
    "Female Fashion",
    "Travel",
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEmpty = _controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        bool isMobile = MediaQuery.of(context).size.width < 600;

        return Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4),
          child: Column(
            children: [
              if (isMobile)
                Container(
                  padding: EdgeInsets.zero, // Removed padding for mobile
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Row(
                        children: [
                          PopupMenuButton<String>(
                            icon:
                                const Icon(Icons.supervisor_account, size: 24),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem<String>(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VendorLogin(),
                                    ),
                                  );
                                },
                                value: 'Vendor',
                                child: const Text('Vendor Account Login'),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResellerLogin(),
                                    ),
                                  );
                                },
                                value: 'Reseller',
                                child: const Text('Reseller Account Login'),
                              ),
                            ],
                          ),
                          const Icon(Icons.person, size: 24),
                          Stack(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.shopping_cart, size: 24),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 6,
                                  child: Text(
                                    cartProvider.cartItems.length.toString(),
                                    style: const TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: isMobile
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isMobile)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 7,
                        ),
                      ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: isMobile ? 40 : 45,
                              decoration: BoxDecoration(
                                color: const Color(0xfff1f1f1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  if (_isEmpty)
                                    const Padding(
                                      padding: EdgeInsets.only(left: 50.0),
                                      child: Text(
                                        "Search Categories...",
                                        style: TextStyle(
                                          color: Color(0xffb2b2b2),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Icon(
                                          Icons.search,
                                          color: Color.fromARGB(
                                              255, 111, 111, 111),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: _controller,
                                          style: const TextStyle(
                                            color: Color(0xff020202),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.5,
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: isMobile
                                ? EdgeInsets.zero
                                : const EdgeInsets.only(left: 8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedCategory,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                style: const TextStyle(
                                  color: Color(0xff020202),
                                  fontSize: 14,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCategory = newValue!;
                                  });
                                },
                                items: _categories
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(
                                      width: isMobile ? 100 : 200,
                                      child: Text(value),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          if (!isMobile)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  PopupMenuButton<String>(
                                    icon: const Icon(Icons.supervisor_account,
                                        size: 24),
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem<String>(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VendorLogin(),
                                            ),
                                          );
                                        },
                                        value: 'Vendor',
                                        child:
                                            const Text('Vendor Account Login'),
                                      ),
                                      PopupMenuItem<String>(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ResellerLogin(),
                                            ),
                                          );
                                        },
                                        value: 'Reseller',
                                        child: const Text(
                                            'Reseller Account Login'),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.person, size: 24),
                                  Stack(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.shopping_cart,
                                            size: 24),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CartPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 6,
                                          child: Text(
                                            cartProvider.cartItems.length
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 8,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
