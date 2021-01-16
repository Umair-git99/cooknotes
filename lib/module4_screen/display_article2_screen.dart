import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DisplayArticle2Screen extends StatefulWidget {
  final Article article;
  final User user;

  DisplayArticle2Screen(this.article, this.user);

  @override
  _DisplayArticle2ScreenState createState() => _DisplayArticle2ScreenState();
}

class _DisplayArticle2ScreenState extends State<DisplayArticle2Screen> {
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
              new Text(widget.article.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Color(0xff00556A),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato Black')),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.article.image,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              new Container(
                  child: Divider(
                height: 30,
              )),
              new Text('By: ' + widget.article.author,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
              SizedBox(height: 10),
              new Text(widget.article.content,
                  style: TextStyle(fontSize: 15.0, fontFamily: 'Lato Black')),
              new Container(
                  child: Divider(
                height: 30,
              )),
              SizedBox(height: 30),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.edit, color: Color(0xff00556A)),
                      onPressed: () {
                        Navigator.pushNamed(context, updateArticleRoute,
                            arguments: UpdateArticleArguments(
                                widget.article, widget.user));
                      }),
                  SizedBox(width: 20),
                  new IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Delete Article"),
                                content: Text(
                                    "Are you sure want to delete this article?"),
                                actions: [
                                  FlatButton(
                                    child: Text("Yes",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xff00556A),
                                            fontFamily: 'Lato Black')),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      removeArticle();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("No",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.red,
                                            fontFamily: 'Lato Black')),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }),
                ],
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

  void removeArticle() {
    setState(() {
      widget.user.article.remove(widget.article);
      Navigator.pushNamed(context, homeRoute, arguments: widget.user);
    });
  }

  void _navigationTap(int index) {
    if (index == 0) {
      setState(() {
        _pageIndex = 0;
      });
      //Navigator.pushNamed(context, homeRoute, arguments: widget.user);
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

class UpdateArticleArguments {
  Article article;
  User user;
  UpdateArticleArguments(this.article, this.user);
}
