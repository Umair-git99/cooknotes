import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../dependencies.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _pageIndex = 2;
  User user;

  @override
  Widget build(BuildContext context) {
    final UserDataService userDataService = service();

    return FutureBuilder<User>(
        future: userDataService.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
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
                  new Text(user.displayName + '\n@' + user.username,
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
                      backgroundImage: AssetImage(user.profilePic),
                      radius: 45.0 - 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                  new Text(user.age.toString(),
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
                  new Text(user.email,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Lato Black',
                          color: new Color(0xff00556A))),
                ],
              ),
              SizedBox(height: 30),
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
                    (user.recipe != null)
                        ? new Text(user.recipe.length.toString(),
                            style: TextStyle(
                                fontSize: 50.0,
                                color: Color(0xff00556A),
                                fontFamily: 'Lato Black'))
                        : new Text('0',
                            style: TextStyle(
                                fontSize: 50.0,
                                color: Color(0xff00556A),
                                fontFamily: 'Lato Black'))
                  ])
                ],
              ),
              SizedBox(height: 10),
              (user.usertype == 'C' && user.article != null)
                  ? buildArticle()
                  : Container(),
              SizedBox(height: 50),
              RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: new Color(0xff00556A),
                  textColor: Colors.white,
                  child: Text('Edit Profile'),
                  onPressed: () {
                    Navigator.pushNamed(context, editProfileRoute);
                  }),
            ],
          ),
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

  void _navigationTap(int index) {
    if (index == 0) {
      setState(() {
        _pageIndex = 0;
      });
      Navigator.pushNamed(context, homeRoute);
    } else if (index == 1) {
      setState(() {
        _pageIndex = 1;
      });
      Navigator.pushNamed(context, plusRoute);
    } else if (index == 2) {
      setState(() {
        _pageIndex = 2;
      });
      //  Navigator.pushNamed(context, profileRoute);
    } else {
      setState(() {
        _pageIndex = index;
      });
      Navigator.pushNamed(context, settingsRoute);
    }
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching recipe... Please wait'),
          ],
        ),
      ),
    );
  }

  buildArticle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Image.asset("assets/article.png", width: 90),
        SizedBox(width: 40),
        new Column(children: <Widget>[
          new Text("Total Article",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff00556A),
                  fontFamily: 'Lato Black')),
          new Text(user.article.length.toString(),
              style: TextStyle(
                  fontSize: 50.0,
                  color: Color(0xff00556A),
                  fontFamily: 'Lato Black'))
        ])
      ],
    );
  }
}
