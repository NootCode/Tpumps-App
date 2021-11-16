import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tpumps_app/pages/drink_maker_page.dart';
import 'package:tpumps_app/pages/home_page.dart';
import 'package:tpumps_app/pages/locations_page.dart';
import 'package:tpumps_app/pages/community_page.dart';
import 'package:tpumps_app/pages/myDrinks_page.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomePage(),
    //CommunityPage(),
    DrinkMakerPage(),
    MyDrinksPage(),
    LocationsPage(),
  ];
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
          opacity: 1,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.red,
          size: 30,
          opacity: 1,
        ),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xff232b2b),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: "Community",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink_outlined),
            label: "DrinkMaker",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.r_mobiledata),
            label: "My Drinks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Locations",
          )
        ],
      ),
    );
  }
}
