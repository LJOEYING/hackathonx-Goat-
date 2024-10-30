import 'package:flutter/material.dart';
import 'package:hackathonx/pages/scanner/result.dart';
import 'package:hackathonx/pages/scanner/scanner.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Management & Car Pooling App',
      debugShowCheckedModeBanner: false,
      home: BottomNavPage(
        myCurrentPage: 0,
      ),
    );
  }
}
