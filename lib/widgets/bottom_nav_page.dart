import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool.dart';
import 'package:hackathonx/pages/green_map.dart';
import 'package:hackathonx/pages/green_connect.dart';
import 'package:hackathonx/pages/remarket.dart';
import 'package:hackathonx/pages/scanner.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int myCurrentPage = 0;
  List pages = const [
    Remarket(),
    GreenMap(),
    Scanner(),
    GreenConnect(),
    CarPooling(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.transparent,
      body: pages[myCurrentPage],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.transparent,
        index: myCurrentPage,
        onTap: (index) {
          setState(() {
            myCurrentPage = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on,
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.qr_code_scanner_sharp,
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.perm_device_information_rounded,
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.directions_car,
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
