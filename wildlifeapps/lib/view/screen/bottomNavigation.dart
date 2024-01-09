import 'package:flutter/material.dart';
import 'package:wildlifeapps/view/screen/loginPage.dart';
import 'package:wildlifeapps/view/screen/splash.dart';
import 'package:wildlifeapps/view/screen/home_screen.dart';
import 'package:wildlifeapps/view/screen/shared_preference.dart';

class DynamicBottomNavBar extends StatefulWidget {
  const DynamicBottomNavBar({super.key});

  @override
  State<DynamicBottomNavBar> createState() => _DynamicBottomNavBarState();
}

class _DynamicBottomNavBarState extends State<DynamicBottomNavBar> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = <Widget>[
    const MyHome(),
    const MyImage()
    // const MyShared(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.last_page_rounded), label: 'Shared Preferences'),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}