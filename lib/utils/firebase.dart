import 'package:annapurna/screens/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:annapurna/screens/LoginScreen.dart';
import 'package:pinput/pinput.dart';
import 'package:annapurna/screens/HomePage.dart';

import '../screens/NameScreen.dart';
import 'dart:io';


class AuthService{
  var kUsers='users';
  var auth = FirebaseAuth.instance;
  String kRegisteredUser = "registered_user";
  String kName = 'name';
  String kEmail = 'email';
  String kAddress = 'address';
  String kLocality = 'locality';
  String kCity = 'city';
  String kPincode='pincode';
  String kState = 'state';

 var firestore = FirebaseFirestore.instance;
  var firestore1 = FirebaseFirestore.instance;
  signIn(AuthCredential authCredential,context)async{
    try{
      await FirebaseAuth.instance.signInWithCredential(authCredential);
      showNameScreen(context);
      // Navigator.pushNamed(context, Interstitial.id);
    }
    catch(e){
      //   Fluttertoast.showToast(
      //       msg: "$e",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
    }

  }
  signInWithOTP(smsCode, verId,BuildContext context) {
    try{
      AuthCredential authCreds = PhoneAuthProvider.credential(
          verificationId: verId, smsCode: smsCode);
      signIn(authCreds,context);}
    catch(e){
      print(e);
    }
  }
  signOut(BuildContext context)async{
    try {
      await auth.signOut();
      Navigator.pushNamed(context, LoginPage.id);
    }
    catch(e){
      print(e);
    }
  }
  isUserRegistered()async{
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection(kRegisteredUser);
    final DocumentSnapshot documentSnapshot = await collectionRef.doc(auth.currentUser?.uid).get();
    if (documentSnapshot.exists) {
      // do something with the document data
      return true;
    }
    return false;
  }
  registerUserForSelling(String name, String email,String address, String locality, String city, String pincode, String state)async{
    try{
      await firestore.collection(kRegisteredUser).doc(auth.currentUser?.uid).set({
        kName:name,kEmail:email,kAddress:email,kLocality:locality,kCity:city,kPincode:pincode,kState:state
      });
    }catch(e){
      print(e);
    }
  }

  showNameScreen(BuildContext context) async{
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection(kUsers);
    final DocumentSnapshot documentSnapshot = await collectionRef.doc(auth.currentUser?.uid).get();
    if (documentSnapshot.exists) {
      Navigator.pushNamed(context, HomePage.id);
      print('exists');
    }
    else
      {
        Navigator.pushNamed(context, NameScreen.id);
        print('does not exist');
      }
  }

  addName(String name) async{
    await firestore1.collection(kUsers).doc(auth.currentUser?.uid).set(
        {
          "name": name,
        });
  }
  addDish(String image, String price, String description,File imageFile){
    String fileName = imageFile.path;
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((value) async{

          await firestore.collection(kUsers).doc(auth.currentUser?.uid).update({kImage1: value});


      });
    });
  }


}

