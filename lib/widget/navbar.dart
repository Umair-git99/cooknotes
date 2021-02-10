import 'package:cooknotes/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  int _pageIndex;
  Navbar(this._pageIndex);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void _navigationTap(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, homeRoute);
    } else if (index == 1) {
      Navigator.pushNamed(context, plusRoute);
    } else if (index == 2) {
      Navigator.pushNamed(context, profileRoute);
    } else {
      Navigator.pushNamed(context, settingsRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xff00556A),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widget._pageIndex,
      onTap: _navigationTap,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: "Add",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
