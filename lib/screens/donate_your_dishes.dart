import 'package:annapurna/screens/addYourDishesPersonal.dart';
import 'package:annapurna/screens/donatedishpersonal.dart';
import 'package:flutter/material.dart';

class DonateYourDishesHome extends StatelessWidget {
  const DonateYourDishesHome({Key? key}) : super(key: key);
  static String id = "/DonateYourDishesHome";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage(
              'assets/images/indian_women.jpg',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Donate your excess food to those in need through our app.'
                ' Join our community of generous donors today and make a positive impact '
                'in your community with just a few clicks.',
            style: TextStyle(color: Colors.white, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 75,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DonateYourDishesPersonal();
              }));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
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
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
