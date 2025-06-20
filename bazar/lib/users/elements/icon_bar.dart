import 'package:flutter/material.dart';

class IconBar extends StatefulWidget {
  const IconBar({super.key});

  @override
  _IconBarState createState() => _IconBarState();
}

class _IconBarState extends State<IconBar> {
  bool isExpanded = false;

  final List<Map<String, String>> icons = [
    {'icon': 'assets/images/medicine_icon.png', 'name': 'Medicine'},
    {'icon': 'assets/images/cosmetics_icon.png', 'name': 'Cosmetics'},
    {'icon': 'assets/images/home-appliance_icon.png', 'name': 'Home Appliance'},
    {'icon': 'assets/images/food_bev_icon.png', 'name': 'Food & Beverages'},
    {'icon': 'assets/images/baby_care.png', 'name': 'Baby Care'},
    {'icon': 'assets/images/homemade_icon.png', 'name': 'Homemade Food'},
    {'icon': 'assets/images/grocery_icon.png', 'name': 'Grocery'},
    {'icon': 'assets/images/toiletries_icon.png', 'name': 'Toiletries'},
    {'icon': 'assets/images/fashion_icon.png', 'name': 'Fashion'},
  ];

  final Color iconColor = const Color.fromARGB(255, 5, 66, 117);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: isExpanded ? 180 : 60,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryIcon(),
            iconList(),
          ],
        ),
      ),
    );
  }

  Widget categoryIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              'assets/images/categories_icon.png',
              height: 30,
              width: 30,
              color: iconColor,
            ),
            if (isExpanded) const SizedBox(width: 10),
            if (isExpanded)
              const Text(
                "Categories",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  Widget iconList() {
    return ListView.builder(
      shrinkWrap: true, // Ensures it doesn’t take extra space
      itemCount: icons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Image.asset(
                icons[index]["icon"]!,
                height: 30,
                width: 30,
                color: iconColor,
              ),
              if (isExpanded) const SizedBox(width: 10),
              if (isExpanded)
                Flexible(
                  child: Text(
                    icons[index]['name']!,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
