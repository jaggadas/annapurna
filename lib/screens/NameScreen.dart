import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:annapurna/utils/firebase.dart';
import 'package:flutter/material.dart';

import '../utils/random.dart';
import '../utils/validate.dart';
class NameScreen extends StatelessWidget {
  static String id='Name';
  var currentNameController = TextEditingController();
  var currentEmailController = TextEditingController();
  var addressController = TextEditingController();
  var localityController = TextEditingController();
  var cityController = TextEditingController();
  var pincodeController = TextEditingController();
  var stateController  = TextEditingController();
  var textFieldHeight = 75.0;
  String name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    child: Image.asset('assets/images/gal-04.png', height: MediaQuery.of(context).size.height/3,),
                  ),
                  SizedBox(height: 30,),
                  Text('Enter Full Name',style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(height: 30,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: currentNameController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter name",

                      ),
                      onChanged: (value){
                        name=value;
                      },
                    ),
                  ),
                  SizedBox(height: 35,),
                 // Spacer(),
                  GestureDetector(
                    onTap: (){
                     AuthService().addName(name);
                     Navigator.pushNamed(context, HomePage.id);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(255, 169, 0, 1),
                            Color.fromRGBO(255, 169, 0, .6),
                          ])),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 150,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
