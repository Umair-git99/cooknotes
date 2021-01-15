import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:flutter/material.dart';

class ArticleListScreen extends StatefulWidget {
  final User user;

  ArticleListScreen(this.user);

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
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
        child: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 500,
                child: ListView.separated(
                  itemCount: widget.user.article.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        leading: Image.asset(widget.user.article[index].image),
                        title: Text(widget.user.article[index].title,
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
                                    "Author: " +
                                        widget.user.article[index].author,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black54,
                                        fontFamily: 'Lato Black')),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, displayArticle2Route,
                              arguments: DisplayArticle2Arguments(
                                  widget.user.article[index], widget.user));
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

class DisplayArticle2Arguments {
  Article article;
  User user;

  DisplayArticle2Arguments(this.article, this.user);
}
