import 'package:annapurna/screens/cart.dart';
import 'package:annapurna/screens/item_nav_bar.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage_widget.dart';

class dish_description extends StatefulWidget {
  dish_description({required this.dishHomePage});
  static const String id = 'dish_description';
  DishHomePage ?dishHomePage;


  @override
  State<dish_description> createState() => _dish_descriptionState();
}

class _dish_descriptionState extends State<dish_description> {
  int quantity=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 25, left: 10, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => cart(dishHomePage: widget.dishHomePage, quantity: quantity,),
                    ));

                  },
                  child: Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.white,
                    size: 26,
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
                child: CircleAvatar(
                  backgroundColor: kGrey,
                  radius: 200,
                  child: ClipOval(
                    child: Image.network(
                      '${widget.dishHomePage!.dishImage}',
                      height: MediaQuery.of(context).size.height / 2.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            SizedBox(
              height: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.dishHomePage!.dishName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                             setState(() {
                               if(quantity!=0)
                               quantity--;
                             });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                CupertinoIcons.minus,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${quantity.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                  quantity++;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${widget.dishHomePage!.dishDescription}',
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      )),
      bottomNavigationBar: nav_bar(dishHomePage: widget.dishHomePage, quantity: quantity,),
    );
  }
}
