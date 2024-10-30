import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathonx/pages/login_sign_in/started_screen.dart';
import 'package:hackathonx/pages/scanner/result.dart';
import 'package:hackathonx/pages/scanner/scanner.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Management & Car Pooling App',
      debugShowCheckedModeBanner: false,
      home: StartedScreen(),
    );
  }
}
