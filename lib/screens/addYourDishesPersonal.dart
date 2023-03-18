import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/utils/toast.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/random.dart';
import '../utils/validate.dart';



class AddYourDishesPersonalDetails extends StatelessWidget {
  AddYourDishesPersonalDetails({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var currentNameController = TextEditingController();
  var currentEmailController = TextEditingController();
  var addressController = TextEditingController();
  var localityController = TextEditingController();
  var cityController = TextEditingController();
  var pincodeController = TextEditingController();
  var stateController  = TextEditingController();
  var textFieldHeight = 75.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      appBar: AppBar(backgroundColor: kGrey,elevation: 0,title: Text("Personal Details"),),
      body: Form(key:_formKey ,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Your Full Name',style: TextStyle(color: Colors.white,fontSize: 15),),
                SizedBox(height: 5,),
                Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                  child: TextFormField(style: getTextFieldStyle(),
                    controller: currentNameController,
                    validator: validateNotEmptyString,
                    decoration: getInputDecoration(
                      "Enter name",

                    ),
                  ),
                ),

                  Text('Email',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: currentEmailController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter email",

                      ),
                    ),
                  ),

                  Text('Address',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: addressController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter address",

                      ),
                    ),
                  ),

                  Text('Locality',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: localityController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter locality",

                      ),
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('City',style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height: 5,),
                          Container(height: textFieldHeight,width: MediaQuery.of(context).size.width/2.25,
                            child: TextFormField(style: getTextFieldStyle(),
                              controller: cityController,
                              validator: validateNotEmptyString,
                              decoration: getInputDecoration(
                                "Enter city",

                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pincode',style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height: 5,),
                          Container(height: textFieldHeight,width: MediaQuery.of(context).size.width/2.25,
                            child: TextFormField(style: getTextFieldStyle(),
                              controller: pincodeController,
                              validator: validateNotEmptyString,keyboardType: TextInputType.number,
                              decoration: getInputDecoration(
                                "Enter pin code",

                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text('State',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: stateController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter state",

                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () async {
                      itef (!_formKey.currentState!.validate()) {
                        return;
                      }
                      FlutterToastService().showToast("Registration Completed.");
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return HomePage.sellActivated();
                      }));

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
                          "Submit Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,)
              ],),
            ),
          )),
    );
  }
}
