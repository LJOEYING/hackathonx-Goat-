import 'package:flutter/material.dart';

// Custom button widget styled specifically for the GreenConnect application.
// Takes in customizable properties for text, colors, and action handling.
class GreenConnectTopButton extends StatelessWidget {
  GreenConnectTopButton(
      {required this.buttonName, // Button label text
      required this.fontColor, // Font color of the button label
      required this.backgroundColor, // Background color of the button
      required this.onPressed, // Callback function when button is pressed
      required this.borderColor, // Border color of the button
      super.key});

  String buttonName;
  int fontColor;
  int backgroundColor;
  int borderColor;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        backgroundColor: Color(backgroundColor),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(borderColor), width: 0.5),
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
            color: Color(fontColor), fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
