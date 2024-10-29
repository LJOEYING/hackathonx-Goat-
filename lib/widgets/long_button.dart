import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongButton extends StatelessWidget {
  final VoidCallback onPressed;  // Callback function when button is pressed
  final String buttonText; // Text displayed on the button
  final int fontColor; // Color of the button text
  final int backgroundColor; // Background color of the button
  final double fontSize; // Font size of the button text

  const LongButton(
      {super.key,
      required this.onPressed, 
      required this.buttonText,
      required this.fontColor,
      required this.backgroundColor,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(backgroundColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed, // Calls the provided function when button is pressed.
        child: Text(
          buttonText,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Color(fontColor),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}
