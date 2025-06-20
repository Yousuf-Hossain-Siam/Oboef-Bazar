import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FirstFourContainer extends StatelessWidget {
  FirstFourContainer({super.key});

  // Define a list of image lists
  final List<List<String>> imageGroups = [
    [
      'assets/images/image 27.png',
      'assets/images/image 12.jpg',
      'assets/images/image 13.jpg',
    ],
    [
      'assets/images/image 11.png',
      'assets/images/image 15.jpg',
      'assets/images/image 16.jpg',
    ],
    [
      'assets/images/image 17.png',
      'assets/images/image 18.png',
      'assets/images/image 19.png',
    ],
    [
      'assets/images/image 20.jpg',
      'assets/images/image 21.jpg',
      'assets/images/image 22.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // First Column of Containers
          Column(
            children: [
              for (int i = 0; i < 2; i++) // Generate first two carousels
                buildCarouselContainer(context, imageGroups[i]),
            ],
          ),

          // Second Column of Containers
          Column(
            children: [
              for (int i = 2; i < 4; i++) // Generate last two carousels
                buildCarouselContainer(context, imageGroups[i]),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build carousel containers
  Widget buildCarouselContainer(BuildContext context, List<String> images) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: isMobile
            ? MediaQuery.of(context).size.height / 6
            : MediaQuery.of(context).size.height / 3,
        width: isMobile
            ? MediaQuery.of(context).size.width / 3
            : MediaQuery.of(context).size.width / 7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(4, 4), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 3,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
            ),
            items: images.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    item,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
