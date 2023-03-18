import 'package:annapurna/screens/cart.dart';
import 'package:annapurna/screens/item_nav_bar.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dish_description extends StatefulWidget {
  static const String id = 'dish_description';
  final String itemName;
  final String itemPrice;
  final String imagePath;
  const dish_description({super.key,
  required this.imagePath,
  required this.itemName,
  required this.itemPrice,
  });

  @override
  State<dish_description> createState() => _dish_descriptionState();
}

class _dish_descriptionState extends State<dish_description> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => cart(imagePath: '', itemName: '', itemPrice: '',)
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
                  child: Image.asset(
                    "assets/images/thali_no.png",
                    height: MediaQuery.of(context).size.height / 2.4,
                    fit: BoxFit.cover,
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
                        "Homemade Thali",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
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
                          Text(
                            " 2",
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
                            onTap: () {},
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
                  "An Indian thali comprises – main-course gravy, dal or curry, sabzi or stir fry, condiments like raita, chutney, pickle, salad, papadum, and side dishes like roti, naan, chapati, paratha, or boiled rice.",
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      )),
      bottomNavigationBar: nav_bar(),
    );
  }
}
