import 'package:annapurna/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage_widget.dart';

class cart extends StatefulWidget {
  cart({required this.dishHomePage, required this.quantity});
  static const String id = 'dish_description';
  DishHomePage ?dishHomePage;
  int quantity=0;

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  bool visible=false;
  @override
  void initState() {
    // TODO: implement initState
    if(widget.quantity!=0)
    {
      setState(() {
        visible=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
    appBar: AppBar(backgroundColor: kGrey,
    title: const Text("Cart"),
    ),
    body: Column(
      children: [
    Column(children: [
    Visibility(
    visible: visible?true:false,
      child: Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Color.fromARGB(255, 51, 51, 51),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Radio(value: "",
                groupValue: "",
                activeColor: kMustard,
                onChanged: (Index){}
            ),
            Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(right: 15),
              child: Image.network(widget.dishHomePage!.dishImage),

            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('${widget.dishHomePage!.dishName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  Text('${widget.dishHomePage!.dishPrice}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        visible=false;
                        widget.quantity=0;
                      });
                    },
                    child: Icon(Icons.delete,
                      color: Colors.red,),
                  ),
                  Row(children: [
                    Container(padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]
                      ),
                      child: Icon(CupertinoIcons.minus,
                        size: 18,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      child: Text('${widget.quantity}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                            color: Colors.white),),
                    ),
                    Container(padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]
                      ),
                      child: Icon(CupertinoIcons.plus,
                        size: 18,),
                    )
                  ],)
                ],
              ),)
          ],
        ),

      ),
    )
      ],),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          padding: EdgeInsets.all(10),
          child: Row(children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.add,
              color: kGrey,),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Add Coupon Code",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
            )
          ],),
        )
      ],
    ),
    bottomNavigationBar: CartBottomNavBar(widget.dishHomePage, widget.quantity),
    );
  }
}

class cartlist extends StatefulWidget {
  cartlist({required this.dishHomePage, required this.quantity});
  DishHomePage ?dishHomePage;
  int quantity=0;


  @override
  State<cartlist> createState() => _cartlistState();
}

class _cartlistState extends State<cartlist> {
  @override
  void initState() {
    // TODO: implement initState
    if(widget.quantity!=0)
      {
        setState(() {
          visible=true;
        });
      }
  }
  bool visible=false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Visibility(
        visible: visible?true:false,
        child: Container(
          height: 110,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Color.fromARGB(255, 51, 51, 51),
          borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(value: "",
              groupValue: "",
              activeColor: kMustard,
              onChanged: (Index){}
              ),
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.network(widget.dishHomePage!.dishImage),

              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('${widget.dishHomePage!.dishName}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                  Text('${widget.dishHomePage!.dishPrice}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)
                ],
              ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        visible=false;
                        widget.quantity=0;
                      });
                    },
                    child: Icon(Icons.delete,
                    color: Colors.red,),
                  ),
                  Row(children: [
                    Container(padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        )
                      ]
                    ),
                    child: Icon(CupertinoIcons.minus,
                    size: 18,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      child: Text('${widget.quantity}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                      color: Colors.white),),
                    ),
                     Container(padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        )
                      ]
                    ),
                    child: Icon(CupertinoIcons.plus,
                    size: 18,),
                    )
                  ],)
                ],
              ),)
            ],
          ),

        ),
      )
    ],);
  }
}

CartBottomNavBar(DishHomePage ?dishHomePage, int ?quantity){
  return BottomAppBar(child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    color: Color.fromARGB(255, 51, 51, 51),
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
            quantity==0?
            Text('₹0',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kMustard
              ),):
            Text('₹${double.parse(dishHomePage!.dishPrice)* quantity!}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kMustard
            ),)
          ],
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
        decoration: BoxDecoration(color: kMustard,
        borderRadius: BorderRadius.circular(20)),
        child: Text("Check Out",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        )
      ],
    ),
  ),);
}