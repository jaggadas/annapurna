import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
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
        home: FirebaseAuth.instance.currentUser!=null?HomePage(): LoginPage(),
        routes: {
          HomePage.id:(context)=> HomePage(),
          LoginPage.id:(context)=> LoginPage(),
        } );


  }
}
