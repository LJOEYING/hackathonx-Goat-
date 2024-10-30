import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// Result widget to display scanned image and generated details
class Result extends StatefulWidget {
  Result({
    required this.imgPath, // Path of the captured image
    required this.details, // Details generated from the image
    super.key,
  });
  final String imgPath;
  final String details;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 40,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Display the scanned image
          SizedBox.expand(
            child: Image.file(
              File(widget.imgPath), // Load image from file
              fit: BoxFit.fill, // Fill the container with the image
            ),
          ),
          // DraggableScrollableSheet to allow users to scroll for more details
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            builder: (BuildContext context, myScrollController) {
              return ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
                child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        // ListView to display the content of the sheet
                        ListView(
                          controller: myScrollController,
                          children: [
                            // Title section for waste details
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                'Waste',
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffd9d9d9),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.all(20),
                                child:
                                    Text(widget.details), // Display the details

                                width: width,
                              ),
                            ),
                            // Points earned section
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff5A8A62),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.all(20),
                                child: Column(children: [
                                  const Text('Points Earned'),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  )
                                ]),
                                width: width,
                              ),
                            ),
                          ],
                        ),
                        // Drag handle indicator at the top of the sheet
                        Positioned(
                          top: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        )
                      ],
                    )),
              );
            },
          )
        ],
      ),
    );
  }
}
