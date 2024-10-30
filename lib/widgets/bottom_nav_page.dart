import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackathonx/pages/carpool/carpool.dart';
import 'package:hackathonx/pages/green_map.dart';
import 'package:hackathonx/pages/green_connect/green_connect.dart';
import 'package:hackathonx/pages/remarket.dart';
import 'package:hackathonx/pages/scanner/scanner.dart';

class BottomNavPage extends StatefulWidget {
  BottomNavPage({required this.myCurrentPage, super.key});
  int myCurrentPage; // Variable to keep track of the current page index

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  // List of pages to navigate between
  List pages = [
    Remarket(), // Home page (second-hand market)
    GreenMap(), // Map page
    Scanner(), // Scanner page 
    GreenConnect(), // Educational Content & Community page
    CarPooling(), // Carpooling page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[widget.myCurrentPage], // Displays the current page based on the selected index
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.transparent,
        index: widget.myCurrentPage, // Sets the initial index of the navigation bar
        onTap: (index) {
          setState(() {
            widget.myCurrentPage = index; // Updates the current page index on tap
          });
        },
        items: [
          Icon(
            Icons.home, // Icon for the home page
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on, // Icon for the map page
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.qr_code_scanner_sharp, // Icon for the scanner page
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.groups, // Icon for the green connect page
            size: 32,
            color: Colors.white,
          ),
          Icon(
            Icons.directions_car, // Icon for the carpooling page
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
