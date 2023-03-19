import 'dart:io';

import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/random.dart';
import '../utils/toast.dart';
import '../utils/validate.dart';

class DonateDishesDetails extends StatefulWidget {
  const DonateDishesDetails({Key? key}) : super(key: key);

  @override
  State<DonateDishesDetails> createState() => _DonateDishesDetailsState();
}

class _DonateDishesDetailsState extends State<DonateDishesDetails> {
  final _formKey = GlobalKey<FormState>();
  var textFieldHeight = 75.0;
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  File? imageFile=null;
  resetState(){
    nameController.text="";
    priceController.text="";
    descriptionController.text="";
    imageFile=null;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kGrey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(key: _formKey,
            child: Container(padding: EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Container(child: Image.asset('assets/images/don.png', height: 280,),)),
                  Text('Dish Name',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: nameController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter name of the dish",

                      ),
                    ),
                  ),

                  Text('Quantity',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: priceController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter Quantity",

                      ),
                    ),
                  ),

                  Text('Description',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 5,),
                  Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                    child: TextFormField(style: getTextFieldStyle(),
                      controller: descriptionController,
                      validator: validateNotEmptyString,
                      decoration: getInputDecoration(
                        "Enter description of the dish",

                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      FlutterToastService().showToast("We'll be there to collect your donated food soon!");
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
                          "Submit details",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],),
            ),
          ),
        ),
      ),
    );
  }

}
