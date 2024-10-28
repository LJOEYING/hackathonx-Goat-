import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizButton extends StatelessWidget {
  QuizButton(
      {required this.quizOpt,
      required this.onPressed,
      required this.currentIndex,
      required this.currentSelectionIndex,
      super.key});
  String quizOpt;
  VoidCallback onPressed;
  int currentIndex;
  int currentSelectionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                quizOpt,
                style: GoogleFonts.workSans(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: currentSelectionIndex == currentIndex
                        ? Color(0xff426d48)
                        : Color(0xff7a6f6f),
                  ),
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              side: BorderSide(
                  color: currentSelectionIndex == currentIndex
                      ? Color(0xff66a66f)
                      : Color(0xff7a6f6f)),
              backgroundColor: currentSelectionIndex == currentIndex
                  ? Color(0xffb9dbbf)
                  : Color(0xffd1cece)),
        ),
      ),
    );
  }
}