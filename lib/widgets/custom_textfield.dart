import 'package:flutter/material.dart';

// CustomTextfield widget, a reusable form field with label text and controller for text input.
class CustomTextfield extends StatefulWidget {
  TextEditingController textEditingController; // Text controller to manage the text input value.
  String labelText;  // Label text to display as a hint above the text input.

  CustomTextfield(
      {super.key,
      required this.textEditingController,
      required this.labelText});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    // Builds a TextFormField with provided controller and label text
    return TextFormField(
      controller: widget.textEditingController, // Links the controller for input management
      decoration: InputDecoration(labelText: widget.labelText),
    );
  }
}
