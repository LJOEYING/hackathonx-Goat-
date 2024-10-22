import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Save",
                          style: GoogleFonts.kayPhoDu(
                              textStyle: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "The",
                          style: GoogleFonts.kayPhoDu(
                              textStyle: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Planet",
                          style: GoogleFonts.kayPhoDu(
                              textStyle: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/img1.png',
                  width: MediaQuery.of(context).size.width * 0.80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      onPressed: () {},
                      child: Text("Get Started",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff489658)))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
