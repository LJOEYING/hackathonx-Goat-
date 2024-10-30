import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewItemPage extends StatefulWidget {
  @override
  _AddNewItemPageState createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  File? _selectedImage; // Variable to hold the selected image
  final ImagePicker _picker = ImagePicker();

  // Controllers to get user input
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _originalPriceController =
      TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCondition; // To hold the selected condition

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    // If an image is selected, update the state with the new image
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers when the page is disposed to avoid memory leaks
    _productNameController.dispose();
    _originalPriceController.dispose();
    _sellingPriceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Method to handle the 'Done' button and pass data back
  void _saveProduct() {
    final Map<String, dynamic> product = {
      'productName': _productNameController.text,
      'originalPrice': _originalPriceController.text,
      'sellingPrice': _sellingPriceController.text,
      'description': _descriptionController.text,
      'condition': _selectedCondition,
      'image': _selectedImage, // Can be null if not selected
    };

    Navigator.pop(context, product); // Pass the product data back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/background3.png',
              fit: BoxFit.cover,
              height: 230,
              width: double.infinity,
            ),
          ),
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
          const Positioned(
            top: 90,
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
          // Image selection area
          Positioned(
            top:
                150, 
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _selectedImage != null
                      ? Image.file(
                          _selectedImage!, // Display selected image
                          height: 200,
                          width: 250,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/addPhoto.png', // Default image if none selected
                          height: 200,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          // Form fields for product details
          Positioned.fill(
            top: 370,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name field
                    _buildTextField('Product Name', 'Enter product name',
                        _productNameController),
                    SizedBox(height: 16),
                    // Original Price field
                    _buildTextField('Original Price', 'Enter original price',
                        _originalPriceController),
                    SizedBox(height: 16),
                    // Selling Price field
                    _buildTextField('Selling Price', 'Enter selling price',
                        _sellingPriceController),
                    SizedBox(height: 16),
                    // Product Condition
                    const Text(
                      'Product Condition',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Condition selection chips
                    Wrap(
                      spacing: 10,
                      children: [
                        ChoiceChip(
                          label: const Text('Never Worn',
                              style: TextStyle(fontSize: 12)),
                          selected: _selectedCondition == 'Never Worn',
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCondition = 'Never Worn';
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Very Good Condition',
                              style: TextStyle(fontSize: 12)),
                          selected: _selectedCondition == 'Very Good Condition',
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCondition = 'Very Good Condition';
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Good Condition',
                              style: TextStyle(fontSize: 12)),
                          selected: _selectedCondition == 'Good Condition',
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCondition = 'Good Condition';
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Fair Condition',
                              style: TextStyle(fontSize: 12)),
                          selected: _selectedCondition == 'Fair Condition',
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCondition = 'Fair Condition';
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Others', style: TextStyle(fontSize: 12)),
                          selected: _selectedCondition == 'Others',
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCondition = 'Others';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Product Description field
                    _buildTextField('Description', 'Enter product description',
                        _descriptionController,
                        maxLines: 3),
                    const SizedBox(height: 16),

                    // Done button to save the product
                    ElevatedButton(
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      onPressed: _saveProduct,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
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

  Widget _buildTextField(
      String labelText, String hintText, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
