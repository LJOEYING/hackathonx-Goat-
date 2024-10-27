import 'package:flutter/material.dart';
import 'package:hackathonx/widgets/post.dart';

class GreenConnectCommunity extends StatefulWidget {
  const GreenConnectCommunity({super.key});

  @override
  State<GreenConnectCommunity> createState() => _GreenConnectCommunityState();
}

class _GreenConnectCommunityState extends State<GreenConnectCommunity> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.asset(
              'assets/background1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.62,
            ),
            Post(
              title: '🗑️ Local Waste Disposal Guidelines 🗑️',
              content:
                  'Recycling Days: Every Tuesday and Thursday. Make sure bins are out by 7 AM!\n What\’s Accepted?: Recycle plastics (#1-2), paper, cardboard, aluminum, and glass. Please, no plastic bags or... ',
              profileName: 'Labubu',
              profilePic: 'assets/labubu.jpg',
            ),
            Post(
              title: '🌿 Plastic-Free Living Tips 🌿',
              content:
                  'Want to reduce your plastic use? Here are a few simple ways to get started: \nBring Your Own Bag: Always carry a reusable shopping bag to avoid single-use plastic bags...',
              profileName: 'Angel',
              profilePic: 'assets/angel.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
