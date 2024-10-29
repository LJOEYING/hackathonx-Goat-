import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/widgets/quiz_button.dart';

class Quiz extends StatefulWidget {
  Quiz(
      {required this.quizTitle,
      required this.quizOpt1,
      required this.quizOpt2,
      required this.quizOpt3,
      required this.quizOpt4,
      // required this.onPressed,
      required this.correctAns,
      required this.handleNextPage,
      super.key});
  int currentIndexSelection = 1;
  String quizTitle;
  String quizOpt1;
  String quizOpt2;
  String quizOpt3;
  String quizOpt4;
  int correctAns;
  // VoidCallback onPressed;
  void Function(int, int) handleNextPage;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Text(
          widget.quizTitle,
          style: GoogleFonts.workSans(
              textStyle: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 20),
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
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                widget.handleNextPage(
                    widget.currentIndexSelection, widget.correctAns);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                backgroundColor: const Color(0xff48794f),
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
