import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  TextEditingController textEditingController;
  String labelText;

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
    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(labelText: widget.labelText),
    );
  }
}
