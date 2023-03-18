import 'package:annapurna/screens/OtpPage.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:flutter/material.dart';

import '../Animations/FadeAnimation.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Image.asset('assets/images/bg_image.jpg', fit: BoxFit.fitWidth,),
        ),
        Container(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              child: Column(
               children: [
                 Text('Welcome!', style: TextStyle(color: Colors.white, fontSize: 50),),
                 Container(
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(30),
                       // boxShadow: [
                       //   BoxShadow(
                       //       color: Color.fromRGBO(143, 148, 251, 0.5),
                       //       blurRadius: 20.0,
                       //       offset: Offset(0, 10))
                       // ]),
                   ),
                   child: Column(
                     children: <Widget>[
                       Container(
                         width: MediaQuery.of(context).size.width*0.9,
                         child: TextField(
                           style: TextStyle(color: Colors.white),
                           keyboardType: TextInputType.phone,
                           onChanged: (value) {
                             phone = countrycode.text + value;
                           },
                           decoration: InputDecoration(
                               border: InputBorder.none,
                               hintText: "Phone number",
                               hintStyle:
                               TextStyle(color: Colors.white),
                           enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                             borderSide: BorderSide(color: kMustard),
                           ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(30),
                               borderSide: BorderSide(color: Colors.white),
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 20,),
                       FadeAnimation(
                         2,
                         GestureDetector(
                           onTap: () async {
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) {
                                   return OtpPage(phone);
                                 }));
                           },
                           child: Container(
                             height: 50,
                             width: MediaQuery.of(context).size.width*0.9,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 gradient: LinearGradient(colors: [
                                   Color.fromRGBO(255, 169, 0, 1),
                                   Color.fromRGBO(255, 169, 0, .6),
                                 ])),
                             child: Center(
                               child: Text(
                                 "Send Otp",
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold),
                               ),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
