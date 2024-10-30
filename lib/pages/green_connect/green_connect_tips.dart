import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathonx/pages/green_connect/green_connect_quiz.dart';

// The GreenConnectTips widget displays tips for improving waste management
class GreenConnectTips extends StatelessWidget {
  const GreenConnectTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfce2),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous screen when the back button is pressed
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.black,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                // Navigates to the GreenConnectQuiz page when the quiz button is pressed
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GreenConnectQuiz()));
              },
              icon: const Icon(
                Icons.quiz_rounded,
                size: 40,
                color: Colors.black,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.70,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background2.png')),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  // Title of the section
                  Text(
                    'How To Improve Waste Management',
                    style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 29)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Description text
                  Text(
                      'As the mass production of material goods continues to increase, so too does the amount of excessive waste. Australians generate over 76 million tonnes of green and general waste every year, according to the Australian Bureau of Statistics. This significant amount of waste is causing detrimental effects on the environment, so it’s important to implement effective and responsible waste disposal. In this blog, we have listed our top 7 tips on how to improve waste management. Read on to learn more.'),
                  SizedBox(
                    height: 35,
                  ),
                  // Subheading for the overview
                  Text(
                    'Overview:',
                    style: GoogleFonts.workSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // List of waste management tips
                  Text(
                      '1. Separate your waste\n 2. Reuse and recycle\n 3. Learn how to compost\n 4. Use sustainable items\n 5. Purchase second-hand items\n 6. Shop locally and buy in bulk\n 7.Reduce paper usage'),
                  SizedBox(
                    height: 35,
                  ),
                  // Subheading for the importance of waste reduction
                  Text(
                    'Why is it important to reduce waste?',
                    style: GoogleFonts.workSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Explanation of the importance of waste reduction
                  Text(
                      'Many of us do the right thing by separating our waste and taking out the bins on the correct days, but some people avoid this, which has a huge impact on the environment. Reducing waste is important for several reasons, including: Reducing pollution: Due to the mixed waste in landfills, toxic greenhouse gas emissions are constantly being released into the atmosphere. This contributes to climate change which then negatively impacts our planet and all living beings. Conserving landfill space: With increased waste, the need to build more landfill spaces is needed. This is a waste of valuable space which could be used for more beneficial purposes (such as planting trees).')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
