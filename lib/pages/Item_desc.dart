import 'package:flutter/material.dart';

class ItemDescPage extends StatefulWidget {
  const ItemDescPage({super.key}); //required itemName, required itemPhoto

  @override
  State<ItemDescPage> createState() => _ItemDescPageState();
}

class _ItemDescPageState extends State<ItemDescPage> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 226, 1),
      body: Stack(
        children: [
          // First Picture: Background Image (background3.png)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/background4.png',
              fit: BoxFit.fill,
              height: 230, // Adjust this height as needed
              width: double.infinity,
            ),
          ),

          // Back Button
          Positioned(
            top: 30, // Adjust padding from top
            left: 5, // Adjust padding from left
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Handle back navigation
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back, color: Colors.black, size: 40),
              ),
            ),
          ),
          // Item Name
          Positioned(
            top: 90, // Adjust this to vertically center the text over the image
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Add New Item', // itemName
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(241, 241, 205, 1),
                ),
              ),
            ),
          ),

          // Item Photo
          Positioned(
            top:
                150, // Adjust this to overlap the bottom part of background3.png
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/shoes1.png',
                  height: 200, // Adjust size as needed
                  width: 250, // Adjust size as needed
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // Content Area
          Positioned.fill(
            top: 380,
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Points Section
                  Center(
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          isHovering = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isHovering = false;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 252, 226, 1),
                          border: Border.all(
                              color: Color.fromRGBO(90, 138, 98, 1), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          isHovering ? 'Redeem' : '3500 points',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Curved Background for Content Area
                  ClipPath(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 245, 1),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(60))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          // Price Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Original Price:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Row(
                                    children: [
                                      Text(
                                        'RM 209.00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'RM 89.00',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Cart Icon and Add to Cart Text
                              Column(
                                children: [
                                  Icon(Icons.shopping_cart_outlined,
                                      size: 30, color: Colors.black),
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey, thickness: 1),

                          // Product Condition
                          Row(
                            children: [
                              Text(
                                'Product Condition:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'Never Worn',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // Description
                          Text(
                            'Description:',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'It is a size of EU 40. Comfortable and supportive, perfect for daily wear or workouts. Iconic design that pairs well with any outfit. Well-maintained and cleaned, ready for a new home!',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 32),

                          // Purchase Button
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                // Handle purchase action
                              },
                              child: Text(
                                'PURCHASE',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
