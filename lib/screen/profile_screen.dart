import 'package:cooknotes/models/user.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen(this.user);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _pageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/cooknotes.png'),
            onPressed: () {},
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('COOKNOTES',
              style: TextStyle(
                  color: Color(0xff00556A), fontFamily: 'Montserrat Black')),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.black,
              onPressed: () {},
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
      body: SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.all(10),
          child: new Column(
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  new Text(
                      widget.user.displayName + '\n@' + widget.user.username,
                      style: new TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Lato Black',
                          color: new Color(0xff00556A),
                          fontWeight: FontWeight.bold)),
                  new Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey[50],
                    radius: 45,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.user.profilePic),
                      radius: 45.0 - 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Row(
                children: [
                  SizedBox(width: 20),
                  new Text('Age:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lato Black',
                          color: new Color(0xff00556A),
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 80),
                  new Text(widget.user.age.toString(),
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lato Black',
                          color: new Color(0xff00556A))),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  new Text('Email:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lato Black',
                          color: new Color(0xff00556A),
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 65),
                  new Text(widget.user.email,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lato Black',
                          color: new Color(0xff00556A))),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Image.asset("assets/cook.png", width: 120),
                  new Column(children: <Widget>[
                    new Text("Total Cooking Notes",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff00556A),
                            fontFamily: 'Lato Black')),
                    new Text(widget.user.recipe.length.toString(),
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Color(0xff00556A),
                            fontFamily: 'Lato Black'))
                  ])
                ],
              ),
              SizedBox(height: 50),
              RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: new Color(0xff00556A),
                  textColor: Colors.white,
                  child: Text('Edit Profile'),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
      Navigator.pushReplacementNamed(context, plusRoute,
          arguments: widget.user);
    } else if (index == 2) {
      setState(() {
        _pageIndex = 2;
      });
      // Navigator.pushReplacementNamed(context, profileRoute,
      //    arguments: widget.user);
    } else {
      setState(() {
        _pageIndex = index;
      });
      Navigator.pushReplacementNamed(context, settingsRoute,
          arguments: widget.user);
    }
  }
}
