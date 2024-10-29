import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/green_connect_quiz.dart';
import 'package:hackathonx/pages/green_connect/green_connect_tips.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';

class ResultDialog extends StatelessWidget {
  ResultDialog({required this.success, required this.score, super.key});
  bool success = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          success
              ? Image.asset(
                  'assets/success.png',
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.width * 0.50,
                )
              : Image.asset(
                  'assets/fail.png',
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.width * 0.50,
                ),
          Text(
            success == true ? 'Congrats!' : "Sorry",
            style: GoogleFonts.workSans(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: success ? Color(0xff305135) : Color(0xff373434))),
          ),
          Text(
              success
                  ? 'You have correct $score question! Well done!'
                  : "You have correct $score questions... Don't give up, please try again",
              textAlign: TextAlign.center,
              style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400))),
        ],
      ),
      actions: success
          ? [
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3d954a)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavPage(myCurrentPage: 3),
                        ),
                      );
                    },
                    child: Text(
                      'Earned 20 Points 🌟',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    )),
              ),
            ]
          : [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff373434)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GreenConnectQuiz(),
                      ),
                    );
                  },
                  child: Text('Retry',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffbdbdbd)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GreenConnectTips(),
                      ),
                    );
                  },
                  child: Text('Close',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                ),
              ])
            ],
    );
  }
}
