import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/screen/display_article_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final List<User> all;

  HomeScreen(this.user, this.all);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
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
            (widget.user.recipe.length != null) ? _imageScroll() : null,
            SizedBox(height: 20),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: new Color(0xff00556A),
              textColor: Colors.white,
              child: Text('View All'),
              onPressed: () {
                Navigator.pushNamed(context, recipeListRoute,
                    arguments: widget.user);
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
            _imageScroll2(widget.all),
            Visibility(
              visible: widget.user.usertype == 'C',
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: new Color(0xff00556A),
                textColor: Colors.white,
                child: Text('My Article'),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 40)
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Color(0xff00556A)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget _imageScroll() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 350.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            (widget.user.recipe.length >= 3) ? 3 : widget.user.recipe.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 400.0,
              width: 300.0,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.user.recipe[index].image,
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      child: new Text(widget.user.recipe[index].foodName,
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
    for (int index = 0; index < widget.all.length; index++) {
      if (widget.all[index].usertype == 'C')
        for (int i = 0; i < widget.all[index].article.length; i++) {
          list.add(
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, displayArticleRoute,
                          arguments: DisplayArguments(
                              widget.all[index].article[i], widget.user));
                    },
                    child: new Image.asset(widget.all[index].article[i].image,
                        width: 200, height: 200),
                  ),
                  new Text(
                    widget.all[index].article[i].title,
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

    for (int index = 0; index < (widget.all.length); index++) {
      if (widget.all[index].usertype == 'C') {
        for (int i = 0; i < widget.all[index].article.length; i++) {
          count++;
        }
      }
    }

    return count;
  }
}

class DisplayArguments {
  Article article;
  User user;

  DisplayArguments(this.article, this.user);
}
