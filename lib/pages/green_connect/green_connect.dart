import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/green_connect_community.dart';
import 'package:hackathonx/pages/green_connect/green_connect_edu.dart';
import 'package:hackathonx/pages/green_connect/green_connect_events.dart';
import 'package:hackathonx/widgets/custom_shapes/curved_edges.dart';
import 'package:hackathonx/widgets/green_connect_top_button.dart';

class GreenConnect extends StatefulWidget {
  GreenConnect({super.key});

  @override
  State<GreenConnect> createState() => _GreenConnectState();
}

class _GreenConnectState extends State<GreenConnect> {
  int currentButtonIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: currentButtonIndex == 2
          ? Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'Create New Post',
                              style: GoogleFonts.workSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                          ),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                ),
                                Image.asset(
                                  'assets/addPhoto.png',
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width * 0.50,
                                ),
                                const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Title',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                                const TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      hintText:
                                          'Write something that you want to share with the community',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                      border: InputBorder.none),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff304b34),
                                      shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'DONE',
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffbdbdbd),
                                      shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'CANCEL',
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                },
                shape: const CircleBorder(),
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: CurvedEdges(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.45,
              color: const Color(0xff304B34),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Image.asset(
                        'assets/img4.png',
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.width * 0.55,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Green",
                            style: GoogleFonts.workSans(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Connect",
                            style: GoogleFonts.workSans(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GreenConnectTopButton(
                    buttonName: "Events",
                    fontColor:
                        currentButtonIndex == 0 ? 0xffffffff : 0x80000000,
                    backgroundColor:
                        currentButtonIndex == 0 ? 0xff000000 : 0xffffffff,
                    borderColor:
                        currentButtonIndex == 2 ? 0xff000000 : 0x80000000,
                    onPressed: () {
                      setState(() {
                        currentButtonIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  GreenConnectTopButton(
                    buttonName: "Educational & Tips",
                    fontColor:
                        currentButtonIndex == 1 ? 0xffffffff : 0x80000000,
                    backgroundColor:
                        currentButtonIndex == 1 ? 0xff000000 : 0xffffffff,
                    borderColor:
                        currentButtonIndex == 2 ? 0xff000000 : 0x80000000,
                    onPressed: () {
                      setState(() {
                        currentButtonIndex = 1;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  GreenConnectTopButton(
                    buttonName: "Community",
                    fontColor:
                        currentButtonIndex == 2 ? 0xffffffff : 0x80000000,
                    backgroundColor:
                        currentButtonIndex == 2 ? 0xff000000 : 0xffffffff,
                    borderColor:
                        currentButtonIndex == 2 ? 0xff000000 : 0x80000000,
                    onPressed: () {
                      setState(() {
                        currentButtonIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          currentButtonIndex == 0
              ? GreenConnectEvents()
              : currentButtonIndex == 1
                  ? GreenConnectEdu()
                  : GreenConnectCommunity(),
        ],
      ),
    );
  }
}
