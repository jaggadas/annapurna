import 'package:annapurna/utils/colors.dart';
import 'package:flutter/material.dart';
InputDecoration getInputDecoration(String hintText) {
  return InputDecoration(

    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: kMustard,
    ),
  ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: kMustard,
      ),
    ),
    hintText: hintText,
    hintStyle: TextStyle(color: kGreyAccent),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(),
    ),
    //fillColor: Colors.green
  );
}

getTextFieldStyle(){
  return TextStyle(color: Colors.white);
}

const kSendButtonTextStyle = TextStyle(
  color:kRed,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
const kTextFieldDecoration=InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kMessageContainerDecoration = BoxDecoration(color: kGrey,
  border: Border(
    top: BorderSide(color: kRed, width: 2.0),
  ),
);
