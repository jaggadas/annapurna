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