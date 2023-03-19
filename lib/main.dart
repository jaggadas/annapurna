import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/screens/LoginScreen.dart';
import 'package:annapurna/screens/NameScreen.dart';
import 'package:annapurna/screens/Splash.dart';
import 'package:annapurna/screens/OnboardingScreen.dart';
import 'package:annapurna/screens/Splash.dart';
import 'package:annapurna/screens/cart.dart';
import 'package:annapurna/screens/ngo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:annapurna/screens/dish_description.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splash(),
        routes: {
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          splash.id: (context) => splash(),
          HomePage.id: (context) => HomePage(),
          LoginPage.id: (context) => LoginPage(),
          ngo.id: (context) => ngo(),
          NameScreen.id: (context) => NameScreen(),
        });
  }
}
