import 'package:flutter/material.dart';
import 'package:hackathonx/pages/car_pooling.dart';
import 'package:hackathonx/pages/green_map.dart';
import 'package:hackathonx/pages/reconnect.dart';
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
    Reconnect(),
    CarPooling(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myCurrentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myCurrentPage = 2;
          });
        },
        backgroundColor: Colors.black,
        shape: CircleBorder(),
        child: Icon(
          Icons.qr_code_scanner_sharp,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
