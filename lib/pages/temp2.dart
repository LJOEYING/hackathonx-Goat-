import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class Remarket extends StatefulWidget {
  const Remarket({super.key});

  @override
  State<Remarket> createState() => _RemarketState();
}

class _RemarketState extends State<Remarket> {
  late PageController _pageController;
  late int _currentPage;
  // List of image paths
  final List<String> _imagePaths = [
    'assets/advertisement1.jpg',
    'assets/advertisement1.jpg',
    'assets/advertisement1.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = 0;

    // Automatically scroll images every 5 seconds
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 5), (timer) {
        if (_pageController.hasClients) {
          int nextPage = (_currentPage + 1) %
              _imagePaths.length; // Use length of imagePaths list
          _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentPage = nextPage;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final pointsBarHeight = 60.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(90, 138, 98, 1),
        elevation: 0,
        toolbarHeight: 90.0,
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Trousers',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            iconSize: 28.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_outlined, color: Colors.white),
            iconSize: 28.0,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            // E-waste Awareness Banner with Slider
            Container(
              height: screenWidth * 0.55 + pointsBarHeight / 2,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Add a PageView for horizontal scrolling
                  Container(
                    height: screenWidth * 0.55, // Adjust height as needed
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount:
                          _imagePaths.length, // Use length of imagePaths list
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        // Use local images from assets
                        final imagePath = _imagePaths[index];
                        return Container(
                          // margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: ClipRRect(
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width:
                                  screenWidth * 0.8, // Adjust width as needed
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Add a circular bullet indicator at the bottom center
                  Positioned(
                    // bottom: 50,
                    bottom: pointsBarHeight + 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_imagePaths.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                  // ),
                  Positioned(
                    bottom: 0, // Adjust this value to control the overlap
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FractionallySizedBox(
                          widthFactor: 0.95, child: PointsBar()),
                    ), // Use your PointsBar widget here
                  ),
                ],
              ),
            ),

            // Selected Goods Section (Recommended & Daily Discover)
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recommend Section
                  SectionHeader(title: 'Recommend'),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                            title: 'Shoe',
                            price: 'RM XXX',
                            image: 'assets/shoes1.png'),
                        ProductCard(
                            title: 'Bottle',
                            price: 'RM XXX',
                            image: 'assets/shoes2.png'),
                        ProductCard(
                            title: 'Bottle',
                            price: 'RM XXX',
                            image: 'assets/shoes2.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Daily Discover Section
                  SectionHeader(title: 'Daily Discover'), //maybe need padding
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                            title: 'Shoe',
                            price: 'RM XXX',
                            image: 'assets/shoes1.png'),
                        ProductCard(
                            title: 'Shoe',
                            price: 'RM XXX',
                            image: 'assets/shoes1.png'),
                        ProductCard(
                            title: 'Shoe',
                            price: 'RM XXX',
                            image: 'assets/shoes1.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PointsBar extends StatelessWidget {
  Widget iconTextSection(
      IconData icon, Color iconColor, String text, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
        Text(
          subtitle,
          style:
              TextStyle(color: Color.fromRGBO(122, 111, 111, 1), fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var pointsBarHeight;
    return Container(
      height: pointsBarHeight, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_scanner, color: Colors.grey)),

            // Vertical Divider between Scan and Wallet Money
            Container(
              height: 30,
              width: 2,
              color: Colors.grey.withOpacity(0.4),
            ),
            // Wallet Money Section
            iconTextSection(
              Icons.account_balance_wallet_outlined,
              Colors.green,
              "RM 100.00",
              "GreenPay",
            ),
            // Vertical Divider between Wallet and Points
            Container(
              height: 30,
              width: 2,
              color: Colors.grey.withOpacity(0.4),
            ),
            // Points Section
            iconTextSection(
              Icons.stars,
              // Color.fromRGBO(251, 209, 95, 1),
              Colors.yellow,
              "1,000 points",
              "Redeem Goodies",
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text('View All >'),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductCard({
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.5;
    final imageHeight = containerWidth * 0.5;

    return Container(
      width: containerWidth,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        // margin: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: containerWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                    Text(
                      price,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            )
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text(
            //         title,
            //         style:
            //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //         textDirection: TextDirection.ltr,
            //         overflow: TextOverflow.visible,
            //         softWrap: true,
            //       ),
            //     ),
            //     Expanded(
            //       child: Text(
            //         price,
            //         style: TextStyle(
            //           color: Colors.red,
            //           fontSize: 16,
            //         ),
            //         textDirection: TextDirection.rtl,
            //         overflow: TextOverflow.visible,
            //         softWrap: true,
            //       ),
            //     ),
            //   ],
            // ),

            // Container(
            //   height: 80,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   title,
            //   style: TextStyle(fontSize: 16),
            // ),
            // Text(
            //   price,
            //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}
