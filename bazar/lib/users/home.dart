import 'package:bazar/users/elements/brand_scroll.dart';
import 'package:bazar/users/elements/carousel_slider.dart';
import 'package:bazar/users/elements/first_four_container.dart';
import 'package:bazar/users/elements/icon_bar.dart';
import 'package:bazar/users/elements/search_bar.dart';
import 'package:bazar/users/elements/trending_product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = MediaQuery.of(context).size.width < 600;
          if (constraints.maxWidth <= 600) {
            // For phones
            return Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    // Left Container (Icon Bar)
                    // IconBar(),
                    // Vertical Divider
                    Container(
                      width: 1, // Divider width
                      color: Colors.grey, // Divider color
                    ),

                    // Right Section (Search Row + Carousel Slider + Containers)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Search Row
                            Gap(10),
                            Search_Bar(),

                            // Divider between Search Bar and Carousel Slider
                            Divider(
                              height: 20, // Reduced height for smaller gap
                              color: Colors.grey, // Divider color
                            ),

                            // Main Content (Carousel and Containers)
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Row with Carousel and Containers
                                    Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Carousel on the left
                                            Gap(5),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Carousel(),
                                              ),
                                            ),

                                            // Right side with two columns of containers
                                            if (isMobile == false)
                                              FirstFourContainer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            if (isMobile == true)
                                              FirstFourContainer(),
                                          ],
                                        )
                                      ],
                                    ),

                                    // Brand List below Carousel and Containers
                                    Brand_Scroll(),

                                    Text(
                                      "Trending Products",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Special products in this month.",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Gap(3),
                                    Divider(
                                      height:
                                          10, // Reduced height for smaller gap
                                      color: Colors.grey, // Divider color
                                    ),

                                    Trending_Product(),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: double.infinity,
                // width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: IconBar(),
                ),
              ),
            ]);
          } else {
            // For laptops or PCs
            return Stack(children: [
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    // Left Container (Icon Bar)
                    // IconBar(),
                    // Vertical Divider
                    Container(
                      width: 1, // Divider width
                      color: Colors.grey, // Divider color
                    ),

                    // Right Section (Search Row + Carousel Slider + Containers)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Search Row
                            Gap(10),
                            Search_Bar(),

                            // Divider between Search Bar and Carousel Slider
                            Divider(
                              height: 20, // Reduced height for smaller gap
                              color: Colors.grey, // Divider color
                            ),

                            // Main Content (Carousel and Containers)
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Row with Carousel and Containers
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Carousel on the left
                                        Gap(5),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Carousel(),
                                          ),
                                        ),

                                        // Right side with two columns of containers
                                        FirstFourContainer(),
                                      ],
                                    ),

                                    // Brand List below Carousel and Containers
                                    Brand_Scroll(),

                                    Text(
                                      "Trending Products",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Special products in this month.",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Gap(3),
                                    Divider(
                                      height:
                                          20, // Reduced height for smaller gap
                                      color: Colors.grey, // Divider color
                                    ),

                                    Trending_Product(),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  height: isExpanded ? 800 : MediaQuery.of(context).size.height,
                  // width: 200,
                  child: IconBar(),
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}
