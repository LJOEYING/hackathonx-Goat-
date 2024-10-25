import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenConnect extends StatelessWidget {
  const GreenConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff304B34),
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            // alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              Positioned(
                right: 30,
                child: Image.asset(
                  'assets/img4.png',
                  width: MediaQuery.of(context).size.width * 0.65,
                  // height: MediaQuery.of(context).size.width * 0.50
                ),
              ),
              Positioned(
                top: 40,
                left: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Green',
                        style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w500))),
                    Text('Connect',
                        style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w500))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
