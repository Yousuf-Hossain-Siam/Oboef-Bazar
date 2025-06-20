import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bazar/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 600;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 115, 0),
        title: Text(
          "Shopping Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return Center(child: Text("No cart items found"));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 8.0 : 50.0),
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                final totalPrice = item['price'] * item['quantity'];
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRect(
                          child: Image(
                            image: AssetImage("${item['images'][0]}"),
                            height: isMobile ? 50 : 80,
                            width: isMobile ? 50 : 80,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 14 : 18),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Price\$${item['price']} x quantity${item['quantity']} = \$$totalPrice",
                                style: TextStyle(
                                    fontSize: isMobile ? 12 : 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Consumer<CartProvider>(
                                builder: (context, cartProvider, child) {
                                  return Text(
                                    "Total: \$$totalPrice",
                                    style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                cartProvider.updateQuantity(index, 1);
                              },
                              icon: Icon(Icons.add_circle, color: Colors.green),
                            ),
                            Text(
                              "${item['quantity']}",
                              style: TextStyle(fontSize: isMobile ? 14 : 18),
                            ),
                            IconButton(
                              onPressed: () {
                                if (item['quantity'] > 1) {
                                  cartProvider.updateQuantity(index, -1);
                                }
                              },
                              icon:
                                  Icon(Icons.remove_circle, color: Colors.red),
                            ),
                            IconButton(
                              icon:
                                  Icon(Icons.cancel_sharp, color: Colors.grey),
                              onPressed: () {
                                cartProvider.removeFromCart(item);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
