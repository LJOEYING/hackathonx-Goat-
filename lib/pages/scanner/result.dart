import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Result extends StatefulWidget {
  Result({
    required this.imgPath,
    required this.details,
    super.key,
  });
  final String imgPath;
  final String details; // Change details to a single Map<String, String>

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.file(
              File(widget.imgPath),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: height * 0.36,
            width: width,
            color: Colors.transparent,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            builder: (BuildContext context, myScrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        ListView(
                          controller: myScrollController,
                          children: [
                            // Example of displaying data from details
                            // ListTile(
                            //   title: Text("Waste Name"),
                            //   subtitle: Text(widget.details['waste_name'] ?? 'N/A'),
                            // ),
                            // ListTile(
                            //   title: Text("Waste Type"),
                            //   subtitle: Text(widget.details['waste_type'] ?? 'N/A'),
                            // ),
                            // ListTile(
                            //   title: Text("Saved CO₂"),
                            //   subtitle: Text(
                            //       widget.details['saved_carbon_dioxide'] ?? 'N/A'),
                            // ),
                            // ListTile(
                            //   title: Text("Ways to Manage"),
                            //   subtitle:
                            //       Text(widget.details['ways_to_manage'] ?? 'N/A'),
                            // ),
                            // Additional containers for styling
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                'Waste',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffd9d9d9),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: EdgeInsets.all(20),
                                child: Text(widget.details),
                                // height: 200.0,
                                width: width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff5A8A62),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: EdgeInsets.all(20),
                                child: Column(children: [
                                  Text('Points Earned'),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  )
                                ]),
                                // height: 200.0,
                                width: width,
                              ),
                            ),
                          ],
                        ),
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
