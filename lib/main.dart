import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathonx/pages/login_sign_in/login.dart';
import 'package:hackathonx/pages/login_sign_in/started_screen.dart';
import 'package:hackathonx/pages/scanner/result.dart';
import 'package:hackathonx/pages/scanner/scanner.dart';
import 'package:hackathonx/widgets/bottom_nav_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCquWHGe3279DAf62DKH-pWR5h2aVNF-tA",
          appId: "1:386262892837:android:52b83534ef7fd4205e9acc",
          messagingSenderId: "386262892837",
          projectId: "hackathon-x-3679f"));

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
      home:Login(),
    );
  }
}
