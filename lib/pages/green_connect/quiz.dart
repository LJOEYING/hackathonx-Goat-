import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/widgets/next_button.dart';
import 'package:hackathonx/widgets/quiz_button.dart';

class Quiz extends StatefulWidget {
  Quiz(
      {required this.quizTitle,
      required this.quizOpt1,
      required this.quizOpt2,
      required this.quizOpt3,
      required this.quizOpt4,
      required this.onPressed,
      required this.correctAns,
      // required this.checkAns,
      super.key});
  int currentIndexSelection = 1;
  String quizTitle;
  String quizOpt1;
  String quizOpt2;
  String quizOpt3;
  String quizOpt4;
  int correctAns;
  VoidCallback onPressed;
  // void Function(int, int) checkAns;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Text(
          widget.quizTitle,
          style: GoogleFonts.workSans(
              textStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: 20),
        QuizButton(
          currentSelectionIndex: widget.currentIndexSelection,
          onPressed: () {
            setState(() {
              widget.currentIndexSelection = 1;
            });
          },
          currentIndex: 1,
          quizOpt: widget.quizOpt1,
        ),
        QuizButton(
          currentSelectionIndex: widget.currentIndexSelection,
          onPressed: () {
            setState(() {
              widget.currentIndexSelection = 2;
            });
          },
          currentIndex: 2,
          quizOpt: widget.quizOpt2,
        ),
        QuizButton(
          currentSelectionIndex: widget.currentIndexSelection,
          onPressed: () {
            setState(() {
              widget.currentIndexSelection = 3;
            });
          },
          currentIndex: 3,
          quizOpt: widget.quizOpt3,
        ),
        QuizButton(
          currentSelectionIndex: widget.currentIndexSelection,
          onPressed: () {
            setState(() {
              widget.currentIndexSelection = 4;
            });
          },
          currentIndex: 4,
          quizOpt: widget.quizOpt4,
        ),
        NextButton(
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
