import 'package:bazar/admin/Register.dart';
import 'package:bazar/providers/cart_provider.dart';
import 'package:bazar/users/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:bazar/users/elements/icon_bar.dart';
import 'package:bazar/users/elements/search_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductFullDescrip extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductFullDescrip({super.key, required this.product});

  @override
  State<ProductFullDescrip> createState() => _ProductFullDescripState();
}

class _ProductFullDescripState extends State<ProductFullDescrip> {
  late String mainImage;

  @override
  void initState() {
    super.initState();
    mainImage = widget.product['picture1'].isNotEmpty
        ? widget.product['picture1'][0]
        : 'assets/images/default.jpg'; // Fallback image
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 600;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobile == true ? Search_Bar() : Search_Bar(),
                // Main Product Image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2),
                      image: DecorationImage(
                          image: AssetImage(mainImage), fit: BoxFit.cover),
                    ),
                  ),
                ),
                const Gap(20),
                // Thumbnail Images
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.product['picture1'].map<Widget>((image) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            mainImage = image;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 1),
                            image: DecorationImage(
                                image: AssetImage(image), fit: BoxFit.cover),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Gap(20),
                // Product Details
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product['name'],
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const Gap(10),
                      Text("\$${widget.product['mrp']}",
                          style: const TextStyle(
                              fontSize: 24, color: Colors.blue)),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(widget.product['description'],
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton("Add to Cart", Colors.deepOrange, () {
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addToCart(widget.product);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }),
                    const Gap(10),
                    _buildButton("Buy Now", Colors.blue, () {
                      print("Buying Now");
                    }),
                  ],
                ),
              ],
            );
          }
          return Column(
            children: [
              Row(
                children: [
                  Container(width: 2, color: Colors.grey), // Vertical divider
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Search_Bar(),
                        const Divider(height: 2, color: Colors.grey),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Thumbnail Images
                                Column(
                                  children: widget.product['images']
                                      .map<Widget>((image) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          mainImage = image;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                          image: DecorationImage(
                                              image: AssetImage(image),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const Gap(30),
                                // Main Product Image
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 4),
                                    image: DecorationImage(
                                        image: AssetImage(mainImage),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Gap(30),
                                // Product Details
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(90),
                                    Text(
                                      widget.product['name'],
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Gap(10),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              300,
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      color: Colors.grey,
                                    ),
                                    const Gap(10),
                                    Text(
                                      "\$${widget.product['price']}",
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                    const Gap(20),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            widget.product['description'],
                                            style:
                                                const TextStyle(fontSize: 15),
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(30),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 350.0),
                                      child: Row(
                                        children: [
                                          // 🛒 Add to Cart Button (Fixed)
                                          _buildButton(
                                            "Add to Cart",
                                            Colors.deepOrange,
                                            () {
                                              final cartProvider =
                                                  Provider.of<CartProvider>(
                                                      context,
                                                      listen: false);
                                              cartProvider
                                                  .addToCart(widget.product);

                                              // ✅ Navigate to Cart Screen
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CartPage()),
                                              );
                                            },
                                          ),
                                          const Gap(20),
                                          // 💰 Buy Now Button
                                          _buildButton("Buy Now", Colors.blue,
                                              () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage()));
                                          }),
                                          const Gap(30),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    bool isMobile = MediaQuery.of(context).size.width <= 600;
    return GestureDetector(
      onTap: onPressed, // ✅ Ensure button triggers the function
      child: Container(
        height: isMobile
            ? MediaQuery.of(context).size.height / 20
            : MediaQuery.of(context).size.height / 20,
        width: isMobile
            ? MediaQuery.of(context).size.width / 5
            : MediaQuery.of(context).size.width / 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
