import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/widgets/quiz_button.dart';

/// A [Quiz] widget that displays a single quiz question with four options
/// and allows users to select an answer and navigate to the next question.
class Quiz extends StatefulWidget {
  Quiz(
      {required this.quizTitle, // The title or main question text for the quiz
      required this.quizOpt1, // Option 1 for the quiz question
      required this.quizOpt2, // Option 2 for the quiz question
      required this.quizOpt3, // Option 3 for the quiz question
      required this.quizOpt4, // Option 4 for the quiz question
      // required this.onPressed,
      required this.correctAns, // Correct answer index (1 to 4)
      required this.handleNextPage, // Function to handle page navigation after selecting an answer
      super.key});
  int currentIndexSelection = 1; // Tracks the user's current selected option
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
        // Displays the quiz title/question text
        Text(
          widget.quizTitle,
          style: GoogleFonts.workSans(
              textStyle: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 20),
        // QuizButton for Option 1
        QuizButton(
          currentSelectionIndex: widget.currentIndexSelection,
          onPressed: () {
            setState(() {
              widget.currentIndexSelection = 1; // Sets selection to option 1
            });
          },
          currentIndex: 1, // Identifier for this option
          quizOpt: widget.quizOpt1, // Displays option 1 text
        ),
        // QuizButton for Option 2
        QuizButton(
          currentSelectionIndex: widget.currentIndexSelection,
          onPressed: () {
            setState(() {
              widget.currentIndexSelection = 2; // Sets selection to option 2
            });
          },
          currentIndex: 2,
          quizOpt: widget.quizOpt2,
        ),
         // QuizButton for Option 3
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
        // QuizButton for Option 4
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
        // NEXT button to submit the answer and go to the next question
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                // Calls handleNextPage with selected and correct answer indices
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
