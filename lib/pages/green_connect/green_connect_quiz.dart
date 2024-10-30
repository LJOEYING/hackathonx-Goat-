import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/quiz.dart';
import 'package:hackathonx/widgets/result_dialog.dart';
import 'package:hackathonx/widgets/quiz_button.dart';

// Main quiz screen widget for Green Connect
class GreenConnectQuiz extends StatefulWidget {
  GreenConnectQuiz({super.key});
  int currentQuiz = 1; // Track the current quiz question (initially set to 1)
  int score = 0;  // Keep score of correct answers
  bool success = false; // Flag to check if the user passed

  @override
  State<GreenConnectQuiz> createState() => _GreenConnectQuizState();
}

class _GreenConnectQuizState extends State<GreenConnectQuiz> {
  // Method to handle actions when navigating to the next question
  void handleNextPage(int correctAns, int selectAns) {
    // Increment score if the selected answer is correct
    if (selectAns == correctAns) {
      widget.score += 1;
      print(widget.score);
    }
    // Check if the last question has been reached
    if (widget.currentQuiz == 3) {
      // Set success to true if the score meets the passing threshold
      if (widget.score >= 3) {
        widget.success = true;
      }
      // Show result dialog with the final score and success status
      showDialog(
          context: context,
          builder: (BuildContext) {
            return ResultDialog(success: widget.success, score: widget.score);
          });
    }
    // If not the last question, proceed to the next one
    if (widget.currentQuiz < 3) {
      setState(() {
        ++widget.currentQuiz; // Increment the current question count
        print(widget.currentQuiz);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfce2),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                // Top container displaying background image for the quiz header
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background2.png'),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Display quiz content based on the current quiz question
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: widget.currentQuiz == 1
                      ? Quiz(
                          quizTitle:
                              'What is the primary benefit of separating waste into different bins?',
                          quizOpt1: "A) Reducing landfill page",
                          quizOpt2: "B) Saving Energy",
                          quizOpt3: "C) Reducing Pollution",
                          quizOpt4: "D) All of the above",
                          correctAns: 4,
                          handleNextPage: handleNextPage,
                        )
                      : widget.currentQuiz == 2
                          ? Quiz(
                              quizTitle:
                                  'What percentage of Australia\'s waste can be composted, according to the International Compost Awareness Week Australia?',
                              quizOpt1: "A) 25%",
                              quizOpt2: "B) 50%",
                              quizOpt3: "C) 75%",
                              quizOpt4: "D) 100%",
                              correctAns: 3,
                              handleNextPage: handleNextPage,
                            )
                          : Quiz(
                              quizTitle:
                                  'Which of the following is NOT recommended for placing in a green waste bin?',
                              quizOpt1: "A) Hair and nail clippings",
                              quizOpt2: "B) Styrofoam",
                              quizOpt3: "C) Food scraps",
                              quizOpt4: "D) Tissues and paper towels",
                              correctAns: 2,
                              handleNextPage: handleNextPage,
                            ),
                ),
              ],
            ),
            // Display a circular widget with the current quiz question number
            Positioned(
              top: MediaQuery.of(context).size.width *
                  0.55, 
              left: MediaQuery.of(context).size.width * 0.35,
              right: MediaQuery.of(context).size.width * 0.35,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    '${widget.currentQuiz}/3', // Display current question number
                    style: GoogleFonts.workSans(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
