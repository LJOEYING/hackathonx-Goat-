import 'package:flutter/material.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Management & Car Pooling App', // The title of the application.
      debugShowCheckedModeBanner: false, // Hides the debug banner in the app.
      home: BottomNavPage(
        myCurrentPage: 0, // The initial page index for the bottom navigation (0 for the first page).
      ),
    );
  }
}
