import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/login_sign_in/login.dart';
import 'package:hackathonx/widgets/long_button.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity, // Expands the container to full width.
          height: double.infinity, // Expands the container to full height.
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First line of the title
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Save",
                          style: GoogleFonts.kayPhoDu(
                              textStyle: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      // Second line of the title
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "The",
                          style: GoogleFonts.kayPhoDu(
                              textStyle: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      // Third line of the title
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Planet",
                          style: GoogleFonts.kayPhoDu(
                              textStyle: const TextStyle(
                                  fontSize: 48,
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
                      // Action when the button is pressed.
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const Login() // Navigate to the Login page.
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
      ),
    );
  }
}
