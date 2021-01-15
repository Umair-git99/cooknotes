import 'package:cooknotes/models/recipe.dart';
import 'package:cooknotes/models/user.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class RecipeListScreen extends StatefulWidget {
  final User user;

  RecipeListScreen(this.user);

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.white,
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
            Container(
              height: 1200,
              child: ListView.separated(
                itemCount: widget.user.recipe.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                      leading: Image.asset(widget.user.recipe[index].image,
                          width: 100, height: 100),
                      title: Text(widget.user.recipe[index].foodName,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black')),
                      subtitle: Column(
                        children: [
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.person, color: Colors.black54),
                              SizedBox(width: 5),
                              new Text(
                                  widget.user.recipe[index].numPerson
                                          .toString() +
                                      ' person',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black54,
                                      fontFamily: 'Lato Black')),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.restaurant_menu,
                                  color: Colors.black54),
                              SizedBox(width: 5),
                              new Text(
                                  'Cook Time: ' +
                                      widget.user.recipe[index].cookHours
                                          .toString() +
                                      ' h ' +
                                      widget.user.recipe[index].cookMins
                                          .toString() +
                                      ' mins',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black54,
                                      fontFamily: 'Lato Black')),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, displayRecipeRoute,
                            arguments: DisplayRecipeArguments(
                                widget.user.recipe[index], widget.user));
                      }),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
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
      Navigator.pushNamed(context, homeRoute, arguments: widget.user);
    } else if (index == 1) {
      setState(() {
        _pageIndex = 1;
      });
      Navigator.pushNamed(context, plusRoute, arguments: widget.user);
    } else if (index == 2) {
      setState(() {
        _pageIndex = 2;
      });
      Navigator.pushNamed(context, profileRoute, arguments: widget.user);
    } else {
      setState(() {
        _pageIndex = index;
      });
      Navigator.pushNamed(context, settingsRoute, arguments: widget.user);
    }
  }
}

class DisplayRecipeArguments {
  Recipe recipe;
  User user;

  DisplayRecipeArguments(this.recipe, this.user);
}
