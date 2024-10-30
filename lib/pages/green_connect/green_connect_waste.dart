import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/green_connect_quiz.dart';

// Stateless widget for the GreenConnectWaste page, displaying information about recyclable waste
class GreenConnectWaste extends StatelessWidget {
  const GreenConnectWaste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfce2),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: const Color(0xfffcfce2),
            )),
        // Quiz button on the top-right to navigate to GreenConnectQuiz page
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GreenConnectQuiz()));
                },
                icon: const Icon(
                  Icons.quiz_rounded,
                  size: 40,
                  color: const Color(0xfffcfce2),
                )),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Stack(
            children: [
              // Main Column for content layout
              Column(
                children: [
                  // Banner section with background image
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.55,
                    decoration: const BoxDecoration(
                      color: Color(0xff304B34),
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/img4.png',
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  // Content section with padding
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 130, left: 40, right: 40),
                    child: Column(
                      children: [
                        Text(
                          'Recyclable Waste',
                          style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w800),
                          ),
                        ),
                        // Description of recyclable waste
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                              'Materials that can be processed and used again, reducing the need for raw resources. Common examples include paper, cardboard, plastics, glass, and metals.'),
                        ),
                        // Subheading for waste management tips
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Text('To manage recyclable waste effectively:',
                              style: GoogleFonts.workSans(
                                textStyle: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w700),
                              )),
                        ),
                        // Additional tips on waste management
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                              'Sort waste at the source: Use separate bins for recyclable and non-recyclable materials. Clean recyclables: Ensure items like containers and jars are rinsed before disposal. Follow local recycling rules: Be aware of specific guidelines on what can or cannot be recycled.'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // Positioned circular image for visual emphasis on recycling
              Positioned(
                top: MediaQuery.of(context).size.width *
                    0.3, // Adjusted top position
                left: MediaQuery.of(context).size.width * 0.2,
                right: MediaQuery.of(context).size.width * 0.2,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/Ellipse 19.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
