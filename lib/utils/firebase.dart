import 'package:annapurna/screens/HomePage.dart';
import 'package:annapurna/screens/NameScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:annapurna/screens/LoginScreen.dart';
import 'package:pinput/pinput.dart';
import 'package:annapurna/screens/HomePage.dart';


class AuthService{
  var kUsers='users';
  var auth = FirebaseAuth.instance;
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


}

