import 'package:flutter/material.dart';

class AddYourDishesHome extends StatelessWidget {
  const AddYourDishesHome({Key? key}) : super(key: key);
  static String id = "/AddyourdishesHome";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/cat3.png'),
            )
        ],
      ),
    );
  }
}
