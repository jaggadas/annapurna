import 'dart:io';

import 'package:annapurna/utils/colors.dart';
import 'package:annapurna/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/random.dart';
import '../utils/toast.dart';
import '../utils/validate.dart';

class AddDishesSell extends StatefulWidget {
  const AddDishesSell({Key? key}) : super(key: key);

  @override
  State<AddDishesSell> createState() => _AddDishesSellState();
}

class _AddDishesSellState extends State<AddDishesSell> {
  final _formKey = GlobalKey<FormState>();
  var textFieldHeight = 75.0;
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  var cuisineController = TextEditingController();

  File? imageFile=null;
  resetState(){
    nameController.text="";
    priceController.text="";
    descriptionController.text="";
    cuisineController.text="";
    imageFile=null;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kGrey,
      body: SingleChildScrollView(
        child: Form(key: _formKey,
          child: Container(padding: EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageFile==null?
                Container(width: double.infinity,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){pickImage();},
                        child:   Container(height: 250,child: Center(child: Icon(Icons.add,color: Colors.black,),),decoration:
                        BoxDecoration(color: Colors.white,shape: BoxShape.circle,
                             ),),
                      ),
                    ],
                  ),
                ):
                Container(width: double.infinity,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){pickImage();},
                        child: Container(decoration: BoxDecoration(color: Colors.white,
                           shape: BoxShape.circle ),
                          height: 250,
                          width: 250,
                          child: ClipOval(child: Image.file(imageFile!,fit: BoxFit.cover,height: 250,)),
                        ),
                      ),
                    ],
                  ),
                ),
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
                Text('Cuisine',style: TextStyle(color: Colors.white,fontSize: 15),),
                SizedBox(height: 5,),
                Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                  child: TextFormField(style: getTextFieldStyle(),
                    controller: cuisineController,
                    validator: validateNotEmptyString,
                    decoration: getInputDecoration(
                      "Enter cuisine",

                    ),
                  ),
                ),

              Text('Price per piece',style: TextStyle(color: Colors.white,fontSize: 15),),
              SizedBox(height: 5,),
              Container(height: textFieldHeight,width: MediaQuery.of(context).size.width,
                child: TextFormField(style: getTextFieldStyle(),
                  controller: priceController,
                  validator: validateNotEmptyString,
                  decoration: getInputDecoration(
                    "Enter price",

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

              GestureDetector(
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  if(imageFile==null){
                    FlutterToastService().showToast("Please add image");
                  }else{
                    print("HELLO");

                      await AuthService().addDish(nameController.text, priceController.text, descriptionController.text, imageFile!,cuisineController.text);
                    resetState();
                  }


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
                      "Add dish to the menu",
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
    );
  }
  pickImage()async{
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile=File(image!.path);
    setState(() {
      imageFile;
    });
  }
}
