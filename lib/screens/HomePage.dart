import 'package:annapurna/screens/homepage_widget.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static String id = "/homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    HomePageElement(),
    Container(),
    Container(),
    Container()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget getDrawerElements(BuildContext contextt){
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[

       Text("Hello")
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
        currentIndex: _selectedIndex,
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
            label: 'Join Us',
          ),
        ],
      ),
      appBar: AppBar(leading: InkWell(child: Icon(Icons.menu,color: kRed,),onTap: (){
        _scaffoldKey.currentState!.openDrawer();
      },),elevation: 0,backgroundColor: kGrey,),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.support_agent_rounded),backgroundColor: kRed,),
      body: _pages[_selectedIndex],
    );
  }
}
