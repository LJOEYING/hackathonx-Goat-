import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/login_sign_in/login.dart';
import 'package:hackathonx/widgets/long_button.dart';
//GetStarted Page
class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, 
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff5A8A62), Color(0xff17241A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Slogan
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Save",
                        style: GoogleFonts.kayPhoDu(
                            textStyle: const TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "The",
                        style: GoogleFonts.kayPhoDu(
                            textStyle: const TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Planet",
                        style: GoogleFonts.kayPhoDu(
                            textStyle: const TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              // Image Section
              Image.asset(
                'assets/img1.png',
                width: MediaQuery.of(context).size.width * 0.80,
              ),
              // Button Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: LongButton(
                  backgroundColor: 0xffffffff,
                  fontColor: 0xff489658,
                  onPressed: () {
                    // Action when the button is pressed
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const Login() // Navigate to the Login page
                        ));
                  },
                  buttonText: "Get Started",
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
