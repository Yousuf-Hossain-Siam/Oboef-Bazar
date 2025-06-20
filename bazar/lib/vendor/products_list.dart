import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductModel {
  String? id;
  String? productName;
  String? productDetails;
  List<String>? picture;
  double? price;
  double? mrp;
  bool? isApproved;
  String? category;

  ProductModel({
    this.id,
    this.productName,
    this.productDetails,
    this.picture,
    this.price,
    this.mrp,
    this.isApproved,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      productName: json['name'],
      productDetails: json['description'],
      picture: [
        json['picture1'] ?? "",
        json['picture2'] ?? "",
        json['picture3'] ?? "",
      ],
      price: double.tryParse(json['reseller_price'] ?? '0') ?? 0.0,
      mrp: double.tryParse(json['mrp'] ?? '0') ?? 0.0,
      isApproved: json['is_active'] == '1',
      category: json['category_name'] ?? "Uncategorized",
    );
  }
}

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  Map<String, List<ProductModel>> categorizedProducts = {};
  bool isLoading = true;
  String errorMessage = "";
  String selectedCategory = "";

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    String url = "http://oboefbazar.com/api/productslist";
    try {
      var response = await http
          .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        if (responseData is List) {
          List<ProductModel> fetchedProducts = responseData
              .map((product) => ProductModel.fromJson(product))
              .toList();

          Map<String, List<ProductModel>> tempCategories = {};

          for (var product in fetchedProducts) {
            if (!tempCategories.containsKey(product.category)) {
              tempCategories[product.category!] = [];
            }
            tempCategories[product.category]!.add(product);
          }

          setState(() {
            categorizedProducts = tempCategories;
            selectedCategory = categorizedProducts.keys.isNotEmpty
                ? categorizedProducts.keys.first
                : "";
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = "Unexpected response format";
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage = "Failed to fetch data: ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Error fetching data: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products List')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;
                    return Row(
                      children: [
                        if (!isMobile) // ✅ Show sidebar only for larger screens
                          Container(
                            width: 200,
                            color: Colors.grey[200],
                            child: ListView(
                              children:
                                  categorizedProducts.keys.map((category) {
                                return ListTile(
                                  title: Text(category),
                                  selected: selectedCategory == category,
                                  tileColor: selectedCategory == category
                                      ? Colors.blue
                                      : Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = category;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        Expanded(
                          child: Column(
                            children: [
                              if (isMobile) // ✅ Dropdown for mobile
                                DropdownButton<String>(
                                  value: selectedCategory,
                                  isExpanded: true,
                                  items: categorizedProducts.keys
                                      .map((String category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedCategory = newValue!;
                                    });
                                  },
                                ),
                              Expanded(
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(10),
                                  itemCount:
                                      categorizedProducts[selectedCategory]
                                              ?.length ??
                                          0,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        isMobile ? 2 : 4, // ✅ Dynamic columns
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.7,
                                  ),
                                  itemBuilder: (context, index) {
                                    final product = categorizedProducts[
                                        selectedCategory]![index];

                                    return Card(
                                      color: Colors.white,
                                      elevation: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: SizedBox(
                                              height: isMobile
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.18
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.26,
                                              child: product.picture!.isNotEmpty
                                                  ? Image.network(
                                                      "https://oboefbazar.com/storage/app/public/${product.picture!.first}",
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                              error,
                                                              stackTrace) =>
                                                          const Icon(Icons
                                                              .image_not_supported),
                                                    )
                                                  : const Icon(Icons
                                                      .image_not_supported),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              product.productName ?? "No Name",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Price: \$${product.price}'),
                                                Text(
                                                    'Details: ${product.productDetails}'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
