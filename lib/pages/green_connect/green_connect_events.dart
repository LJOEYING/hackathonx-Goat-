import 'package:flutter/material.dart';

/// A [GreenConnectEvents] widget that displays an advertisement image,
// an 'Upcoming Events' title with a 'View All' button, and additional images.
// This widget is scrollable, allowing users to view more content.
class GreenConnectEvents extends StatelessWidget {
  const GreenConnectEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Displays the first advertisement image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/event1.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 20),
              // Row for 'Upcoming Events' title and 'View All' button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Displays the 'Upcoming Events' title
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Upcoming Events',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // 'View All' button to view more events
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All >',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Displays the second advertisement image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/event2.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/event3.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
