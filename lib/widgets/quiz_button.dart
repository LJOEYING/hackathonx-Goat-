import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// A stateless widget `QuizButton` that represents an option button in a quiz. It displays
// the quiz option text and changes appearance based on whether it's the selected option.
class QuizButton extends StatelessWidget {
   // Constructor accepts parameters: quiz option text, onPressed callback, index of the option, 
  // and currently selected option index to determine button appearance.
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
              Expanded(
                child: Text(
                  quizOpt,  // Display the quiz option text
                  style: GoogleFonts.workSans(
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w400,
                      color: currentSelectionIndex == currentIndex
                          ? Color(0xff426d48)
                          : Color(0xff7a6f6f),
                    ),
                  ),
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              side: BorderSide(
                  color: currentSelectionIndex == currentIndex
                      ? const Color(0xff66a66f)
                      : const Color(0xff7a6f6f)),
              backgroundColor: currentSelectionIndex == currentIndex
                  ? const Color(0xffb9dbbf)
                  : const Color(0xffd1cece)),
        ),
      ),
    );
  }
}
