import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/recipe.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/module4_screen/display_article_screen.dart';
import 'package:cooknotes/module3_screen/recipelist_screen.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../dependencies.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  User user;
  Article article;
  List<User> all;
  final userDataService = UserRestService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: userDataService.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            all = snapshot.data;
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
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Text('What do you\ncook today?',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 45.0,
                    fontFamily: 'Lato Black',
                    color: new Color(0xff00556A),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            (user.recipe != null)
                ? _imageScroll()
                : new Text('Your recipe is empty. Add a new one',
                    style: new TextStyle(
                        fontSize: 20.0, fontFamily: 'Lato Black')),
            SizedBox(height: 10),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: new Color(0xff00556A),
              textColor: Colors.white,
              child: Text('View All'),
              onPressed: () {
                Navigator.pushNamed(context, recipeListRoute);
              },
            ),
            SizedBox(height: 40),
            Text('Weekly tips\nfrom chefs',
                textAlign: TextAlign.left,
                style: new TextStyle(
                    fontSize: 45.0,
                    fontFamily: 'Lato Black',
                    color: new Color(0xff00556A),
                    fontWeight: FontWeight.bold)),
            _imageScroll2(all),
            user.usertype == 'C' ? _buildArticleButton() : Container(),
            SizedBox(height: 40)
          ],
        )),
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

  Widget _imageScroll() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 260.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: user.recipe.length > 3 ? 3 : user.recipe.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 400.0,
              width: 300.0,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      await userDataService.setRecipe(index);
                      Navigator.pushNamed(context, displayRecipeRoute);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        user.recipe[index].image,
                        height: 200.0,
                        width: 300.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      child: new Text(user.recipe[index].foodName,
                          style: new TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lato Black',
                              color: new Color(0xff00556A),
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _imageScroll2(List<User> all) {
    List<Widget> list = new List<Widget>();
    for (int index = 0; index < all.length; index++) {
      if (all[index].usertype == 'C')
        for (int i = 0; i < all[index].article.length; i++) {
          list.add(
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await userDataService.setArticle(index, i);
                      Navigator.pushNamed(context, displayArticleRoute);
                    },
                    child: new Image.asset(all[index].article[i].image,
                        width: 200, height: 150),
                  ),
                  new Text(
                    all[index].article[i].title,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Lato Black',
                        color: new Color(0xff00556A)),
                  )
                ],
              ),
            ),
          );
        }
    }
    return new Column(children: list);
  }

  _getItemCount() {
    int count = 0;

    for (int index = 0; index < (all.length); index++) {
      if (all[index].usertype == 'C') {
        for (int i = 0; i < all[index].article.length; i++) {
          count++;
        }
      }
    }

    return count;
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
      // Navigator.pushNamed(context, homeRoute);
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

  _buildArticleButton() {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: new Color(0xff00556A),
      textColor: Colors.white,
      child: Text('My Article'),
      onPressed: () {
        Navigator.pushNamed(context, articleListRoute);
      },
    );
  }
}
