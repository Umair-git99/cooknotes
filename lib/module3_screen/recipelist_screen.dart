import 'package:cooknotes/dependencies.dart';
import 'package:cooknotes/models/recipe.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RecipeListScreen extends StatefulWidget {
  RecipeListScreen();

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  int _pageIndex = 0;
  User user;
  final userDataService = UserRestService();

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Color(0xff00556A)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
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
        child: Column(
          children: [
            (user.recipe != null)
                ? Container(
                    height: 1200,
                    child: ListView.separated(
                      itemCount: user.recipe.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                            leading: Image.asset(user.recipe[index].image,
                                width: 100, height: 100),
                            title: Text(user.recipe[index].foodName,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color(0xff00556A),
                                    fontFamily: 'Lato Black')),
                            subtitle: Column(
                              children: [
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.person,
                                    ),
                                    SizedBox(width: 5),
                                    new Text(
                                        user.recipe[index].numPerson
                                                .toString() +
                                            ' person',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Lato Black')),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.restaurant_menu,
                                    ),
                                    SizedBox(width: 5),
                                    new Text(
                                        'Cook Time: ' +
                                            user.recipe[index].cookHours
                                                .toString() +
                                            ' h ' +
                                            user.recipe[index].cookMins
                                                .toString() +
                                            ' mins',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'Lato Black')),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () async {
                              await userDataService.setRecipe(index);
                              Navigator.pushNamed(
                                context,
                                displayRecipeRoute,
                              );
                            }),
                      ),
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                      ),
                    ),
                  )
                : new Text('Your recipe is empty. Add a new one',
                    style: new TextStyle(
                        fontSize: 20.0, fontFamily: 'Lato Black')),
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
      Navigator.pushNamed(context, profileRoute);
    } else {
      setState(() {
        _pageIndex = index;
      });
      Navigator.pushNamed(context, settingsRoute);
    }
  }
}
