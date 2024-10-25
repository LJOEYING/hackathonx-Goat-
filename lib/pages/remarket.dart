import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

    // Automatically scroll images every 3 seconds
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
            Stack(
              alignment: Alignment.center,
              children: [
                // Add a PageView for horizontal scrolling
                Container(
                  height: screenWidth * 0.5, // Adjust height as needed
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
                            width: screenWidth * 0.8, // Adjust width as needed
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Add a circular bullet indicator at the bottom center
                Positioned(
                  bottom: 10,
                  child: Container(
                    height: 20,
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
                ),
              ],
            ),
            // GreenPay Balance & Points
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RM 100.00',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('GreenPay'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '1,000 points',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Redeem Goodies'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Selected Goods Section (Recommended & Daily Discover)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recommend Section
                  SectionHeader(title: 'Recommend'),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductCard(
                            title: 'Bottle',
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
                  // Daily Discover Section
                  SectionHeader(title: 'Daily Discover'),
                  SizedBox(
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

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text('View All'),
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
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            price,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
