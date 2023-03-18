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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
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
      appBar: AppBar(leading: InkWell(child: Icon(Icons.menu,color: kRed,),onTap: (){},),elevation: 0,backgroundColor: kGrey,),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.support_agent_rounded),backgroundColor: kRed,),
      body: _pages[_selectedIndex],
    );
  }
}
