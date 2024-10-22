import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final int fontColor;
  final int backgroundColor;
  final double fontSize;

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
        onPressed: onPressed,
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
