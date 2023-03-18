import 'package:annapurna/Animations/FadeAnimation.dart';
import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/screens/OnboardingScreen.dart';
import 'package:flutter/material.dart';


class splash extends StatefulWidget {

  static String id="splash";
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetonextpage();
  }

  navigatetonextpage()async{
    await Future.delayed(Duration(milliseconds: 3000), (){
      Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
        body:
        FadeAnimation(
          0,
           Center(
            child:
            Container(
                child: Column(children: [
                  Image.asset(
                    "assets/images/SplashScreen.png",
                    fit: BoxFit.fill,

                  )  ]
                )
            ),
          ),
        ) );

  }
}