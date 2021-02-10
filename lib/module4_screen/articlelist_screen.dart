import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import 'package:cooknotes/user_viewmodel.dart';
import 'package:cooknotes/view.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

class ArticleListScreen extends StatefulWidget {
  ArticleListScreen();

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  int _pageIndex = 0;
  User user;
  final userDataService = UserRestService();

  @override
  Widget build(BuildContext context) {
    return View<UserViewmodel>(
        initViewmodel: (viewmodel) => viewmodel.getUser(),
        // future: userDataService.getUser(),
        builder: (context, viewmodel, _) {
          if (viewmodel.busy) {
            return _buildFetchingDataScreen();
          }
          user = viewmodel.users;
          return _buildMainScreen();
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
        child: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 1200,
                child: ListView.separated(
                  itemCount: user.article.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        leading: Image.asset(user.article[index].image),
                        title: Text(user.article[index].title,
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
                                    "Author: " + user.article[index].author,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black54,
                                        fontFamily: 'Lato Black')),
                              ],
                            ),
                          ],
                        ),
                        onTap: () async {
                          await userDataService.setArticle2(index);
                          Navigator.pushNamed(context, displayArticle2Route);
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
            Text('Fetching article... Please wait'),
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
