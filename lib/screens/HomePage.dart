import 'package:annapurna/screens/AddDishesSell.dart';
import 'package:annapurna/screens/customerSupport.dart';
import 'package:annapurna/screens/donate_your_dishes.dart';
import 'package:annapurna/screens/homepage_widget.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:annapurna/utils/firebase.dart';
import 'package:flutter/material.dart';

import 'add_your_dishes.dart';
import 'ngo.dart';


class HomePage extends StatefulWidget {
  HomePage(){

  }
  int selectedIndex = 0;
  HomePage.sellActivated(){
    selectedIndex=1;
  }
  HomePage.launchSlide(int index){
    selectedIndex=index;

  }
  static String id = "/homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isUserRegistered = false;
  List<Widget> _pages =[HomePageElement(),
    AddYourDishesHome(),
    DonateYourDishesHome(),
    ngo()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserRegisteredBool();

  }
  isUserRegisteredBool()async {
    isUserRegistered=await AuthService().isUserRegistered();
    setState(() {
      getListOfPages();
    });
  }
  getListOfPages(){
    _pages = [
      HomePageElement(),
      isUserRegistered?AddDishesSell():AddYourDishesHome(),
      DonateYourDishesHome(),
      ngo(),
    ];
    setState(() {

    });
  }


  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }
  Widget getDrawerElements(BuildContext contextt){
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[

       SizedBox(height: 200,),
        Container(width: double.infinity,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(onPressed: ()async{await AuthService().signOut(contextt);}, child: Text("Log Out",style: TextStyle(color: Colors.white,fontSize: 20),)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,
      backgroundColor: kGrey,
      drawer:  Drawer(backgroundColor: kRed,

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: getDrawerElements(context),
      ),
      bottomNavigationBar:BottomNavigationBar(backgroundColor: kGrey,
        currentIndex: widget.selectedIndex,
        selectedItemColor: kRed,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Register NGO',
          ),
        ],
      ),
      appBar: AppBar(leading: InkWell(child: Icon(Icons.menu,color: kRed,),onTap: (){
        _scaffoldKey.currentState!.openDrawer();
      },),elevation: 0,backgroundColor: kGrey,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CustomerSupport();
        }));
      },child: Icon(Icons.support_agent_rounded),backgroundColor: kRed,),
      body: _pages[widget.selectedIndex],
    );
  }
}
