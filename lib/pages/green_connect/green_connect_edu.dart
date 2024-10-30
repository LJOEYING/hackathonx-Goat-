import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/green_connect_tips.dart';
import 'package:hackathonx/pages/green_connect/green_connect_waste.dart';
import 'package:hackathonx/widgets/waste_container.dart';

// The GreenConnectEdu widget displays educational content related to waste management.
class GreenConnectEdu extends StatelessWidget {
  const GreenConnectEdu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title for Categories section
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 15, bottom: 1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // Horizontal scrolling list for waste categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Waste category button for Recyclable
                    WasteContainer(
                      wasteIcon: 'assets/icon1.png',
                      wasteType: 'Recyclable',
                      wasteWidth: 60,
                      wasteHeight: 60,
                      onTap: () {
                        // Navigates to the waste management page when tapped.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GreenConnectWaste()));
                      },
                    ),
                    // Waste category button for Non-Recyclable
                    WasteContainer(
                      wasteIcon: 'assets/icon2.png',
                      wasteType: 'Non\nRecyclable',
                      wasteWidth: 60,
                      wasteHeight: 60,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GreenConnectWaste()));
                      },
                    ),
                    // Waste category button for Organic
                    WasteContainer(
                      wasteIcon: 'assets/icon3.png',
                      wasteType: 'Organic',
                      wasteWidth: 55,
                      wasteHeight: 55,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GreenConnectWaste()));
                      },
                    ),
                    // Waste category button for Chemical
                    WasteContainer(
                      wasteIcon: 'assets/icon4.png',
                      wasteType: 'Chemical',
                      wasteWidth: 70,
                      wasteHeight: 70,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GreenConnectWaste()));
                      },
                    ),
                  ],
                ),
              ),
              // Title for Waste Management Tips section
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, bottom: 1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Waste Management Tips',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigates to tips page when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GreenConnectTips()),
                  );
                },
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: Color(0xff304e35),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Highlights',
                          style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          'Collection',
                          style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Color(0XFFFEF8F8).withOpacity(0.60),
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              // Row for displaying two different tip cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First tip card for Zero-Waste Lifestyle
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GreenConnectTips()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.width * 0.70,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xff4f8057),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zero-Waste',
                            style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            'Lifestyle',
                            style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0XFFFEF8F8).withOpacity(0.60),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tip card for Community Waste Initiatives
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GreenConnectTips()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffdddd81),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Community',
                                  style: GoogleFonts.workSans(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff373434),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'Waste Initiatives',
                                  style: GoogleFonts.workSans(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: Color(0XFF373434)
                                              .withOpacity(0.60),
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Tip card for Smart Waste Management
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GreenConnectTips()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffaaaa6b),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Smart',
                                  style: GoogleFonts.workSans(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff373434),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'Waste Management',
                                  style: GoogleFonts.workSans(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color: const Color(0XFF373434)
                                              .withOpacity(0.60),
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
