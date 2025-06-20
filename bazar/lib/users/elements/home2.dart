import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  // List of icons and their labels
  final List<Map<String, dynamic>> iconsData = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.notifications, 'label': 'Notifications'},
    {'icon': Icons.settings, 'label': 'Settings'},
    {'icon': Icons.account_circle, 'label': 'Account'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // First Column with ListView.builder
          SizedBox(
            width: 200,
            child: Expanded(
              child: ListView.builder(
                itemCount: iconsData.length,
                itemBuilder: (context, index) {
                  return Tooltip(
                    message: iconsData[index]['label'],
                    child: ListTile(
                      leading: Icon(iconsData[index]['icon']),
                      title: Text(iconsData[index]['label']),
                    ),
                  );
                },
              ),
            ),
          ),

          // Second Column with 10 text widgets
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(10, (index) {
              return Text('Text $index');
            }),
          ),
        ],
      ),
    );
  }
}
