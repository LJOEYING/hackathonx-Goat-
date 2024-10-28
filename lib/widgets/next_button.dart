import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  NextButton({required this.onPressed, super.key});
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            backgroundColor: Color(0xff48794f),
          ),
          child: Text(
            'NEXT',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
