import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:cooknotes/screen/create_recipe_screen.dart';
import 'package:flutter/material.dart';

class PlusButtonScreen extends StatefulWidget {
  final User user;
  static String routeName = "/plusbutton";

  PlusButtonScreen(this.user);

  @override
  _PlusButtonScreenState createState() => _PlusButtonScreenState();
}

class _PlusButtonScreenState extends State<PlusButtonScreen> {
  int _pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text('COOKNOTES',
              style: TextStyle(
                  color: Color(0xff00556A), fontFamily: 'Montserrat Black')),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, logoutRoute, (_) => false);
              },
              child: Text("Logout",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
      ),
      body: new Container(
        padding: EdgeInsets.all(20),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
              child: new InkWell(
                onTap: () {
                  Navigator.pushNamed(context, createRecipeRoute,
                      arguments: widget.user);
                },
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: new Column(
                    children: <Widget>[
                      new Image.asset('assets/cook.png',
                          height: 100, width: 100),
                      new Text('Create a new recipe',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black')),
                    ],
                  ),
                ),
              ),
            ),
            widget.user.usertype == 'C' ? newArticleCard() : Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff00556A),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _pageIndex,
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
      ),
    );
  }

  newArticleCard() {
    return Card(
      child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, createArticleRoute,
              arguments: widget.user);
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: new Column(
            children: <Widget>[
              new Image.asset('assets/article.png', height: 100, width: 100),
              new Text('Create a new article',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
            ],
          ),
        ),
      ),
    );
  }

  void _navigationTap(int index) {
    if (index == 0) {
      setState(() {
        _pageIndex = 0;
      });
      Navigator.pushReplacementNamed(context, homeRoute,
          arguments: widget.user);
    } else if (index == 1) {
      setState(() {
        _pageIndex = 1;
      });
      //Navigator.pushReplacementNamed(context, plusRoute,
      //  arguments: widget.user);
    } else if (index == 2) {
      setState(() {
        _pageIndex = 2;
      });
      Navigator.pushReplacementNamed(context, profileRoute,
          arguments: widget.user);
    } else {
      setState(() {
        _pageIndex = index;
      });
      Navigator.pushReplacementNamed(context, settingsRoute,
          arguments: widget.user);
    }
  }
}
