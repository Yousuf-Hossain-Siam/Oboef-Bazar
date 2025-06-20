import 'package:flutter/material.dart';
import 'dart:async';

class Brand_Scroll extends StatefulWidget {
  const Brand_Scroll({super.key});

  @override
  State<Brand_Scroll> createState() => _Brand_ScrollState();
}

class _Brand_ScrollState extends State<Brand_Scroll> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  final List<String> brands = [
    "Apple",
    "Samsung",
    "Microsoft",
    "Google",
    "Amazon",
    "Lenovo",
    "Dell",
    "Apple",
    "Samsung",
    "Microsoft",
    "Google",
    "Amazon",
    "Lenovo",
    "Dell",
    "Apple",
    "Samsung",
    "Microsoft",
    "Google",
    "Amazon",
    "Lenovo",
    "Dell",
    "Google",
    "Amazon",
    "Lenovo",
    "Dell",
  ];

  // Tracks hover state for each container
  final Map<int, bool> _hovering = {};

  @override
  void initState() {
    super.initState();
    // Initialize hover states
    for (var i = 0; i < brands.length; i++) {
      _hovering[i] = false;
    }

    // Auto-scrolling logic
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentPosition = _scrollController.offset;

        if (currentPosition < maxScrollExtent) {
          _scrollController.animateTo(
            currentPosition + 100, // Scroll by 100 pixels
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        } else {
          _scrollController.jumpTo(0); // Reset to the start
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                _hovering[index] = true;
              });
            },
            onExit: (_) {
              setState(() {
                _hovering[index] = false;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.transparent, // Make container invisible
              ),
              child: Center(
                child: Text(
                  brands[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _hovering[index]! ? Colors.black : Colors.grey[400],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: brands.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
