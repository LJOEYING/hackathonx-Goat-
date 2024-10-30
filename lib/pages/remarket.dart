import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathonx/pages/Item_desc.dart';
import 'package:hackathonx/pages/newItem.dart';

class Remarket extends StatefulWidget {
  const Remarket({super.key});

  @override
  State<Remarket> createState() => _RemarketState();
}

class _RemarketState extends State<Remarket> {
  late PageController _pageController; // Controller for managing page views
  late int _currentPage; // Stores the current page index for image slider
  bool _isSelectedGoods =
      true; // Boolean to toggle between tabs (Selected Goods or Sell)

  // List of image paths
  final List<String> _imagePaths = [
    'assets/ad1.png',
    'assets/ad2.png',
    'assets/ad3.png',
  ];

// Sample data for products for the "Sell" scetion
  final List<Map<String, dynamic>> _products = [
    {
      'image': 'assets/item1.png',
      'name': 'Molteni Cloths Closet ',
      'price': 'RM 199.20',
    },
    {
      'image': 'assets/item2.png',
      'name': 'Panasonic Microwave',
      'price': 'RM 50.99',
    },
    {
      'image': 'assets/item3.jpg',
      'name': 'Toshiba hair dryer',
      'price': 'RM 38.50',
    },
    {
      'image': 'assets/item4.png',
      'name': 'BlackPink Lightstick',
      'price': 'RM45.99',
    },
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
          // Moves to the next page or loops back to the first page
          int nextPage = (_currentPage + 1) % _imagePaths.length;
          _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          // Updates the current page index
          setState(() {
            _currentPage = nextPage;
          });
        }
      });
    });
  }

  // Toggles between the "Selected Goods" and "Sell" tab
  void _toggleTab(bool isSelectedGoods) {
    setState(() {
      _isSelectedGoods = isSelectedGoods;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final pointsBarHeight = 60.0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          // Icon button for shopping cart
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            iconSize: 28.0,
            onPressed: () {},
          ),
          // Icon button for chat
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
            // E-waste Awareness Banner with Slider
            Container(
              height: screenWidth * 0.55 + pointsBarHeight / 2,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // PageView for horizontal scrolling of images
                  Container(
                    height: screenWidth * 0.55,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _imagePaths.length,
                      onPageChanged: (index) {
                        // Updates the current page when the user scrolls
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final imagePath =
                            _imagePaths[index]; // Gets the image path
                        return Container(
                          child: ClipRRect(
                            // Displays the image with fit and clipping
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: screenWidth * 0.8,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Circular bullet indicator for the slider
                  Positioned(
                    bottom:
                        pointsBarHeight + 10, // Positions the bullet indicator
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
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FractionallySizedBox(
                          widthFactor: 0.95, child: PointsBar()),
                    ),
                  ),
                ],
              ),
            ),
            // Build the tab section for Selected Goods and Sell
            _buildTabSection(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  // Widget to build a tab button (Selected Goods or Sell)
  Widget _buildTabButton(String label, bool isSelected, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 3,
              width: 50,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          border: Border.all(
            color: Color.fromRGBO(227, 227, 130, 1),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton(
                    'Selected Goods', _isSelectedGoods, () => _toggleTab(true)),
                SizedBox(width: 60),
                _buildTabButton(
                    'Sell', !_isSelectedGoods, () => _toggleTab(false)),
              ],
            ),
            SizedBox(height: 10),

            // Display content based on selected tab
            _isSelectedGoods
                ? _buildSelectedGoodsSection() // Show selected goods
                : _buildSellSection(), // Show sell section
          ],
        ),
      ),
    );
  }

  //Build Selected Goods section
  Widget _buildSelectedGoodsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recommend Section
          SectionHeader(title: 'Recommend'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItemDescPage()),
                    );
                  },
                  child: ProductCard(
                      title: 'Yamaha U2H Piano',
                      price: 'RM 374.50',
                      image: 'assets/item5.png'),
                ),
                ProductCard(
                    title: 'Nike Air Max',
                    price: 'RM 25.50',
                    image: 'assets/item6.png'),
                ProductCard(
                    title: 'Lenovo IdeaPad i3',
                    price: 'RM 189.00',
                    image: 'assets/item7.png'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Daily Discover Section
          SectionHeader(title: 'Daily Discover'),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProductCard(
                    title: 'BTS Lightstick',
                    price: 'RM 65.00',
                    image: 'assets/item8.png'),
                ProductCard(
                    title: 'Padini T-Shirt',
                    price: 'RM 8.90',
                    image: 'assets/item9.jpg'),
                ProductCard(
                    title: 'Cellini Leather Sofa',
                    price: 'RM 599.90',
                    image: 'assets/item10.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sell Section Content
  Widget _buildSellSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Product Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemCount: _products.length,
            itemBuilder: (context, index) {
              return _buildProductCard(_products[index]);
            },
          ),

          Positioned(
            right: 0,
            bottom: 50,
            child: FloatingActionButton(
              onPressed: () {
                // Navigates to AddNewItemPage when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewItemPage()),
                );
              },
              shape: CircleBorder(),
              backgroundColor: Colors.black,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

// Build each product card with image, name, and price
  Widget _buildProductCard(Map<String, dynamic> product) {
    // Check if the product is null, and if so, return an empty box to prevent errors
    if (product == null) {
      return SizedBox(); // Return an empty box if the product is null
    }
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              product['image'],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 125,
            ),
            // ),
          ),

          // Product Name and Price Row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Name with flexible size and ellipsis
                Expanded(
                  child: Text(
                    product['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 4),

                // Product Price
                Text(
                  product['price'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for a points bar that displays QR scan, wallet, and points sections
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
      height: pointsBarHeight,
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
    final imageHeight = containerWidth * 0.62;

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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    price,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
