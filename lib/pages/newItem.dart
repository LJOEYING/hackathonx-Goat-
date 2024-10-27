import 'package:flutter/material.dart';

class AddNewItemPage extends StatefulWidget {
  @override
  _AddNewItemPageState createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  bool _isDescriptionSelected = false; // To toggle the description button
  bool _isNeverWornSelected = false; // For "Never Worn"
  bool _isFullyNewSelected = false; // For "Fully New"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // First Picture: Background Image (background3.png)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/background3.png',
              fit: BoxFit.cover,
              height: 230, // Adjust this height as needed
              width: double.infinity,
            ),
          ),

          // Back Button (Top Left Overlapping Background Image)
          Positioned(
            top: 30, // Adjust padding from top
            left: 16, // Adjust padding from left
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Handle back navigation
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(
                      0.5), // Optional background color for visibility
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
              ),
            ),
          ),

          // "Add New Item" Text (Center of First Picture)
          Positioned(
            top:
                100, // Adjust this to vertically center the text over the image
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Add New Item',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Second Picture (addPhoto.png) overlapping the bottom part of the first image
          Positioned(
            top:
                180, // Adjust this to overlap the bottom part of background3.png
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/addPhoto.png',
                height: 200, // Adjust size as needed
                width: 250, // Adjust size as needed
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content Section (Product Name, Price, Description Button, etc.)
          Positioned.fill(
            top: 370, // Adjust this to make space for the overlapping images
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16), // Spacing between fields

                    // Price Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16), // Spacing between fields

                    // Description Button (Selectable)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDescriptionSelected = !_isDescriptionSelected;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        decoration: BoxDecoration(
                          color: _isDescriptionSelected
                              ? Colors.blue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _isDescriptionSelected
                                ? Colors.blue
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Description',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _isDescriptionSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Icon(
                              _isDescriptionSelected
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: _isDescriptionSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Spacing between fields

                    // Selectable Description Options (Never Worn, Fully New)
                    Row(
                      children: [
                        // Never Worn Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isNeverWornSelected = !_isNeverWornSelected;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: _isNeverWornSelected
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _isNeverWornSelected
                                    ? Colors.blue
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              'Never Worn',
                              style: TextStyle(
                                color: _isNeverWornSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16), // Spacing between buttons

                        // Fully New Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFullyNewSelected = !_isFullyNewSelected;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: _isFullyNewSelected
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _isFullyNewSelected
                                    ? Colors.blue
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              'Fully New',
                              style: TextStyle(
                                color: _isFullyNewSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16), // Spacing between fields

                    // Description Field (Multiline)
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3, // Allow multiline input
                    ),

                    // Add More Fields as necessary...

                    SizedBox(height: 16), // Extra spacing for scroll

                    // Submit Button (At the bottom)
                    ElevatedButton(
                      onPressed: () {
                        // Handle Add Item action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add Item',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
