import 'package:flutter/material.dart';
import 'package:hackathonx/widgets/post.dart';

// The GreenConnectCommunity widget displays community posts related to waste management
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
            // First post in the community feed
            Post(
              title:
                  '🗑️ Local Waste Disposal Guidelines 🗑️', // Title of the post
              content:
                  'Recycling Days: Every Tuesday and Thursday. Make sure bins are out by 7 AM!\n What\’s Accepted?: Recycle plastics (#1-2), paper, cardboard, aluminum, and glass. Please, no plastic bags or... ',
              profileName: 'Labubu', // Name of the post author
              profilePic: 'assets/labubu.jpg',
            ),
            // Second post in the community feed
            Post(
              title: '🌿 Plastic-Free Living Tips 🌿',
              content:
                  'Want to reduce your plastic use? Here are a few simple ways to get started: \nBring Your Own Bag: Always carry a reusable shopping bag to avoid single-use plastic bags...',
              profileName: 'Angel', // Name of the post author
              profilePic: 'assets/angel.jpg',
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
