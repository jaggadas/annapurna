import 'package:annapurna/screens/addYourDishesPersonal.dart';
import 'package:flutter/material.dart';

class AddYourDishesHome extends StatelessWidget {
  const AddYourDishesHome({Key? key}) : super(key: key);
  static String id = "/AddyourdishesHome";
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            CircleAvatar(radius: 150,
              backgroundImage: AssetImage('assets/images/indian_women.jpg',),
            ),
          SizedBox(height: 10,),
          Text('Monetize your cooking skills. Sell your homemade food to customers using our platform '
              'and earn money from home. Our app provides an easy platform for you to showcase your culinary '
              'talents and reach a wider audience. Join our community of talented home chefs today.',
            style: TextStyle(color: Colors.white,fontSize: 15),textAlign: TextAlign.center,),
          SizedBox(height: 75,),
          GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddYourDishesPersonalDetails();
              }));

            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 169, 0, 1),
                    Color.fromRGBO(255, 169, 0, .6),
                  ])),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
