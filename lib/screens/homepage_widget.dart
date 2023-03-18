import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';


class HomePageElement extends StatelessWidget {
  HomePageElement({Key? key}) : super(key: key);
  List carouselImageList = [
    'assets/chef_india.png',
    'assets/chef_india.png',
    'assets/chef_india.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
              getTopCarousel(context)
              ,
              SizedBox(height: 10,),
              getDishes()
          ],
        ),
      ),
    );
  }
  Widget getDishes(){
    return Column(
      children: [
        FoodElementHomePage(),
        FoodElementHomePage(),
        FoodElementHomePage(),
        FoodElementHomePage(),
      ],
    );
  }
  Widget getCarouselBox(Widget childWidget,double radius,double height,) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: kOrange,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: childWidget,
      ),
    );
  }
  Widget getTopCarousel(BuildContext context) {
    double height2 = 100;
    double width = 100;
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: getCarouselBox(
        Image.asset(
          carouselImageList[0],
          width: width,
        ),
        10,
        height2,
      ),
    ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: getCarouselBox(
          Image.asset(
            carouselImageList[1],
            width: width,
          ),
          10,
          height2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: getCarouselBox(
          Image.asset(
            carouselImageList[2],
            width: width,
          ),
          10,
          height2,
        ),
      ),
    ],);
  }


}


class FoodElementHomePage extends StatefulWidget {
  const FoodElementHomePage({Key? key}) : super(key: key);

  @override
  State<FoodElementHomePage> createState() => _FoodElementHomePageState();
}

class _FoodElementHomePageState extends State<FoodElementHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 140.0,
        width: MediaQuery.of(context).size.width,

        margin: EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: kGreyAccent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [

            Container(
                height: 180.0,
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: kMustard,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  child: Image.asset(
                    "assets/food.jpeg",
                    height: 180.0,
                    width: 120.0,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              width: MediaQuery.of(context).size.width/1.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Butter Chicken",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(children: [SvgPicture.asset(
                        "assets/vegnonveg.svg",
                        semanticsLabel: 'vegnonveg',color: Colors.green,
                        height: 20,
                    ),SizedBox(width:10),Text("Maharashtrian",style: TextStyle(color: Colors.white),)],),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "18 Mar / 9:00 PM" ,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(children: [Icon(Icons.place_outlined,color: kRed,),Text('10.5 kms',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white))],),

                      ],
                    ),
                    Divider(color: kOrange,),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("₹110",style: TextStyle(color: Colors.white),)],
                    )

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
