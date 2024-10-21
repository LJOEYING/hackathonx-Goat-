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
      backgroundColor: Colors.white,
      body: pages[myCurrentPage],
      floatingActionButton: Container(
        width: 60,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              myCurrentPage = 2;
            });
          },
          backgroundColor: Colors.black,
          shape: CircleBorder(),
          child: Icon(
            Icons.qr_code_scanner_sharp,
            size: 35,
            color: myCurrentPage == 2 ? Colors.white : Colors.grey,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        // surfaceTintColor: Colors.red,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          // height: 30,
          // width: 20,
          // color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    // minWidth: 70,
                    onPressed: () {
                      setState(() {
                        myCurrentPage = 0;
                      });
                    },
                    child: Icon(
                      Icons.home,
                      size: 35,
                      color: myCurrentPage == 0 ? Colors.white : Colors.grey,
                    ),
                  ),
                  MaterialButton(
                    // minWidth: 70,
                    onPressed: () {
                      setState(() {
                        myCurrentPage = 1;
                      });
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 35,
                      color: myCurrentPage == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    // minWidth: 70,
                    onPressed: () {
                      setState(() {
                        myCurrentPage = 3;
                      });
                    },
                    child: Icon(
                      Icons.perm_device_information_outlined,
                      size: 35,
                      color: myCurrentPage == 3 ? Colors.white : Colors.grey,
                    ),
                  ),
                  MaterialButton(
                    // minWidth: 70,
                    onPressed: () {
                      setState(() {
                        myCurrentPage = 4;
                      });
                    },
                    child: Icon(
                      Icons.car_crash,
                      size: 35,
                      color: myCurrentPage == 4 ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
