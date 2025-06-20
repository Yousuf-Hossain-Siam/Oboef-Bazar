import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return CarouselSlider(
      options: CarouselOptions(
        height: isMobile
            ? MediaQuery.of(context).size.height / 3
            : MediaQuery.of(context).size.height / 1.4,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: isMobile ? 16 / 9 : 4 / 1,
        viewportFraction: isMobile
            ? 1.0
            : 0.8, // Show part of the next image on larger screens
      ),
      items: [
        'assets/images/image 1.jpg',
        'assets/images/image 2.jpg',
        'assets/images/image 3.jpg',
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover, // Changed to cover for better scaling
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
