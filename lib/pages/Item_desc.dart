// The main page that displays the item description
import 'package:flutter/material.dart';

class ItemDescPage extends StatefulWidget {
  const ItemDescPage({super.key});

  @override
  State<ItemDescPage> createState() => _ItemDescPageState();
}

class _ItemDescPageState extends State<ItemDescPage>
    with SingleTickerProviderStateMixin {
  bool isHovering =
      false; // Track if the mouse is hovering over the redeem button


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 252, 226, 1),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/background4.png',
              fit: BoxFit.fill,
              height: 230,
              width: double.infinity,
            ),
          ),

          // Back Button to return to the previous page
          Positioned(
            top: 30,
            left: 5,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.arrow_back, color: Colors.black, size: 40),
              ),
            ),
          ),
          // Item Name displayed at the top center of the page
          const Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Yamaha U2H Piano',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(241, 241, 205, 1),
                ),
              ),
            ),
          ),

          // Item Photo displayed below the item name
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/item5.png',
                  height: 200,
                  width: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // Scrollable section for item details
          Positioned.fill(
            top: 375,
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Points Section with hover effect
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          backgroundColor: isHovering == false
                              ? const Color.fromRGBO(252, 252, 226, 1)
                              : Colors.green[400],
                          side: const BorderSide(
                              color: Color.fromRGBO(90, 138, 98, 1), width: 2)),
                      onPressed: () {
                        setState(() {
                          isHovering = true;
                        });
                      },
                      child: Text(
                        isHovering == false ? '3500 points' : 'Redeem',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Main container for item details
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 245, 1),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(60))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 5),
                        // Price Section with original price, discounted price, and add to cart option
                        const Row(
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
                                Text(
                                  'RM 2288.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'RM 374.50',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
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
                        const Divider(color: Colors.grey, thickness: 2),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            const Text(
                              'Product Condition:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Very Good Condition',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Description section for item details
                        const Text(
                          'Description:',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            'This upright piano has 88 weighted keys for a realistic feel and delivers rich, warm sound with responsive action, suitable for all skill levels and music styles. Includes a built-in music stand and soft pedal for quieter practice. Well-maintained and recently tuned.',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Purchase Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Handle purchase action
                            },
                            child: const Text(
                              'PURCHASE',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
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
