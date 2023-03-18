import 'package:annapurna/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'homepage_widget.dart';

class nav_bar extends StatelessWidget {
  nav_bar({required this.dishHomePage, required this.quantity});
  DishHomePage ?dishHomePage;
  int quantity=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Price per item",
              style: TextStyle(  
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 10,),
              Text("Rs ${dishHomePage!.dishPrice}",
              style: TextStyle(  
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),)
            ],
          ),
          InkWell(
            onTap: () {
              
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => cart(dishHomePage: dishHomePage, quantity: quantity,),
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: kMustard,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
                ),
                child: Row(children: [
                  Text("Buy Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.cart_fill,
                  color: Colors.white,
                  size: 26,)
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}