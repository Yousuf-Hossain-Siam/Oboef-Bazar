import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Demotest extends StatefulWidget {
  @override
  _DemotestState createState() => _DemotestState();
}

class _DemotestState extends State<Demotest> {
  String productName = "Loading..."; // Default state

  @override
  void initState() {
    super.initState();
    fetchProductName();
  }

  Future<void> fetchProductName() async {
    String url = "https://oboefbazar.com/api/productslist";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "mode": "no-cors",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        if (responseData is List && responseData.isNotEmpty) {
          setState(() {
            productName = responseData[0]['name'] ?? "No Name Found";
          });
        } else {
          setState(() {
            productName = "No products available";
          });
        }
      } else {
        setState(() {
          productName = "Failed to load (${response.statusCode})";
        });
        print("Error: ${response.body}");
      }
    } catch (e) {
      setState(() {
        productName = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Name')),
      body: Center(
        child: Text(
          productName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
