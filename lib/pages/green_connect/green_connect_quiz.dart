import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/quiz.dart';
import 'package:hackathonx/widgets/next_button.dart';
import 'package:hackathonx/widgets/quiz_button.dart';

class GreenConnectQuiz extends StatefulWidget {
  GreenConnectQuiz({super.key});
  int currentQuiz = 1;
  int score = 0;

  void checkAns(int correctAns, int selectAns) {
    if (selectAns == correctAns) {
      score += 1;
    }
  }

  @override
  State<GreenConnectQuiz> createState() => _GreenConnectQuizState();
}

class _GreenConnectQuizState extends State<GreenConnectQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfce2),
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
                            onPressed: () {
                              setState(() {
                                widget.currentQuiz = 2;
                                print(widget.currentQuiz);
                              });
                            },
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
                                onPressed: () {
                                  setState(() {
                                    widget.currentQuiz = 3;
                                    print(widget.currentQuiz);
                                  });
                                },
                              )
                            : Quiz(
                                quizTitle:
                                    'Which of the following is NOT recommended for placing in a green waste bin?',
                                quizOpt1: "A) Hair and nail clippings",
                                quizOpt2: "B) Styrofoam",
                                quizOpt3: "C) Food scraps",
                                quizOpt4: "D) Tissues and paper towels",
                                correctAns: 2,
                                onPressed: () {
                                  print(widget.currentQuiz);
                                },
                              )),
              ],
            ),
            Positioned(
              top: 230,
              left: 100,
              right: 100,
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
                    '${widget.currentQuiz}/3',
                    style: GoogleFonts.workSans(
                      textStyle: TextStyle(
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
