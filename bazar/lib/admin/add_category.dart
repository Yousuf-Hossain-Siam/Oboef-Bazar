import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selectedCategory;
  String? selectedSubCategory;

  final Map<String, List<String>> categories = {
    "Mobiles": ["Smartphones", "Feature Phones", "Mobile Accessories"],
    "Electronics": ["Laptops", "Televisions", "Cameras", "Audio"],
    "Fashion": ["Men's Clothing", "Women's Clothing", "Kids' Clothing"],
    "Home": ["Furniture", "Home Decor", "Kitchen Appliances"],
    "Beauty": ["Skincare", "Haircare", "Makeup"],
    "Sports": ["Fitness Equipment", "Outdoor Gear", "Sportswear"],
    "Books": ["Fiction", "Non-Fiction", "Educational"],
    "Grocery": ["Fruits", "Vegetables", "Beverages"],
    "Toys": ["Action Figures", "Educational Toys", "Puzzles"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category Screen',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CupertinoButton(
              color: Colors.green,
              pressedOpacity: 0.5,
              sizeStyle: CupertinoButtonSize.medium,
              child: Text(
                "Add Category",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String newCategory = "";
                    String newSubCategory = "";
                    return AlertDialog(
                      title: Text(
                        "Add Category",
                        style: GoogleFonts.poppins(color: Colors.green),
                      ),
                      content: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                newCategory = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Category",
                              ),
                            ),
                            TextField(
                              onChanged: (value) {
                                newSubCategory = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter SubCategory",
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        CupertinoButton(
                          color: Colors.red,
                          sizeStyle: CupertinoButtonSize.medium,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        CupertinoButton(
                          color: Colors.green,
                          sizeStyle: CupertinoButtonSize.medium,
                          onPressed: () {
                            setState(() {
                              categories[newCategory] = [
                                newSubCategory,
                              ];
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.keys.length,
              itemBuilder: (context, index) {
                final category = categories.keys.elementAt(index);
                return Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 24, 29, 59),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.category, color: Colors.white),
                          ),
                          title: Text(
                            category,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Delete Category",
                                      style: GoogleFonts.poppins(
                                          color: Colors.red),
                                    ),
                                    content: Text(
                                        "Are you sure you want to delete?"),
                                    actions: [
                                      CupertinoButton(
                                        color: Colors.red,
                                        sizeStyle: CupertinoButtonSize.small,
                                        onPressed: () {
                                          setState(() {
                                            categories.remove(category);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      CupertinoButton(
                                        color: Colors.green,
                                        sizeStyle: CupertinoButtonSize.small,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if (categories[category] != null &&
                            categories[category]!.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: DropdownButton<String>(
                              value: selectedCategory == category
                                  ? selectedSubCategory
                                  : null,
                              hint: Text(
                                "Select Subcategory",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                              items: categories[category]!
                                  .map<DropdownMenuItem<String>>(
                                      (String subCategory) {
                                return DropdownMenuItem<String>(
                                    value: subCategory,
                                    child: Text(
                                      subCategory,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color:
                                            (subCategory == selectedSubCategory)
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = category;
                                  selectedSubCategory = newValue;
                                });
                              },
                              isExpanded: true,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (selectedCategory != null && selectedSubCategory != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Selected Subcategory: $selectedSubCategory",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
