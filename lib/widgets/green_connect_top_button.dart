import 'package:flutter/material.dart';

class GreenConnectTopButton extends StatelessWidget {
  GreenConnectTopButton(
      {required this.buttonName,
      required this.fontColor,
      required this.backgroundColor,
      required this.onPressed,
      required this.borderColor,
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
