import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import 'package:cooknotes/widget/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../dependencies.dart';

class DisplayArticleScreen extends StatefulWidget {
  DisplayArticleScreen();

  @override
  _DisplayArticleScreenState createState() => _DisplayArticleScreenState();
}

class _DisplayArticleScreenState extends State<DisplayArticleScreen> {
  int _pageIndex = 0;

  Article article;
  final userDataService = UserRestService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Article>(
        future: userDataService.getArticle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            article = snapshot.data;
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
          child: new Container(
            padding: EdgeInsets.all(30),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(article.title.toUpperCase(),
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Color(0xff00556A),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato Black')),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    article.image,
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                new Container(
                    child: Divider(
                  height: 30,
                )),
                new Text('By: ' + article.author,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Color(0xff00556A),
                        fontFamily: 'Lato Black')),
                SizedBox(height: 10),
                new Text(article.content,
                    style: TextStyle(fontSize: 15.0, fontFamily: 'Lato Black')),
                new Container(
                    child: Divider(
                  height: 30,
                )),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Navbar(_pageIndex));
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
}
