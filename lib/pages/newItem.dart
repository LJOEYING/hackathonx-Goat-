import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewItemPage extends StatefulWidget {
  @override
  _AddNewItemPageState createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  bool _isNeverWornSelected = false; // For "Never Worn"
  File? _selectedImage; // Variable to hold the selected image

  final ImagePicker _picker = ImagePicker(); // Image picker instance

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path); // Save the selected image
      });
    }
  }

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
                  color: Color.fromRGBO(241, 241, 205, 1),
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
              child: GestureDetector(
                onTap: _pickImage, // On tap, open gallery
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _selectedImage != null
                      ? Image.file(
                          _selectedImage!,
                          height: 200,
                          width: 250,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/addPhoto.png',
                          height: 200, // Adjust size as needed
                          width: 250, // Adjust size as needed
                          fit: BoxFit.cover,
                        ),
                ),
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
                    _buildTextField('Product Name', 'Enter product name'),
                    SizedBox(height: 16),

                    // Original Price Field
                    _buildTextField('Original Price', 'Enter original price'),
                    SizedBox(height: 16),

                    // Selling Price Field
                    _buildTextField('Selling Price', 'Enter selling price'),
                    SizedBox(height: 16),

                    // Product Condition Section
                    Text(
                      'Product Condition',
                      style: TextStyle(
                        fontSize: 20, // Smaller font size
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      children: [
                        ChoiceChip(
                          label: Text('Never Worn',
                              style:
                                  TextStyle(fontSize: 12)), // Font size reduced
                          selected: false,
                          onSelected: (bool selected) {
                            _isNeverWornSelected = selected; //??
                          },
                        ),
                        ChoiceChip(
                          label: Text('Very Good Condition',
                              style:
                                  TextStyle(fontSize: 12)), // Font size reduced
                          selected: false,
                          onSelected: (bool selected) {
                            // Handle selection
                          },
                        ),
                        ChoiceChip(
                          label: Text('Good Condition',
                              style:
                                  TextStyle(fontSize: 12)), // Font size reduced
                          selected: false,
                          onSelected: (bool selected) {
                            // Handle selection
                          },
                        ),
                        ChoiceChip(
                          label: Text('Fair Condition',
                              style:
                                  TextStyle(fontSize: 12)), // Font size reduced
                          selected: false,
                          onSelected: (bool selected) {
                            // Handle selection
                          },
                        ),
                        ChoiceChip(
                          label: Text('Others',
                              style:
                                  TextStyle(fontSize: 12)), // Font size reduced
                          selected: false,
                          onSelected: (bool selected) {
                            // Handle selection
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Product Description
                    _buildTextField('Description', 'Enter product description',
                        maxLines: 3),
                    SizedBox(height: 16),

                    ElevatedButton(
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff3F6245),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
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

  // Method to build TextFields with a uniform style
  Widget _buildTextField(String labelText, String hintText,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 20, // Set label text size to match your design
            fontWeight: FontWeight.w600, // Bold font for the label
          ),
        ),
        SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12), // Smaller hint text size
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
