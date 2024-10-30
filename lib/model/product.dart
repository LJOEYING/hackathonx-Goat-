import 'dart:io';

class Product {
  String productName;
  String originalPrice;
  String sellingPrice;
  String condition;
  String description;
  File? image; // Optional for the selected image

  Product({
    required this.productName,
    required this.originalPrice,
    required this.sellingPrice,
    required this.condition,
    required this.description,
    this.image,
  });
}
