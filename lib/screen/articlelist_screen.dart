import 'package:cooknotes/models/user.dart';
import 'package:flutter/material.dart';

class ArticleListScreen extends StatefulWidget {
  final User user;

  ArticleListScreen(this.user);

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Color(0xff00556A)),
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
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new SizedBox(height: 30),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("assets/article.png", width: 120),
                  SizedBox(width: 10),
                  new Column(
                    children: <Widget>[
                      new Text("Total Article",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black')),
                      new Text(widget.user.article.length.toString(),
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black'))
                    ],
                  )
                ],
              ),
              new Container(
                  child: Divider(
                color: Colors.black,
                height: 30,
              )),
              Container(
                height: 500,
                child: ListView.separated(
                  itemCount: widget.user.article.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        leading:
                            Icon(Icons.notes, size: 50, color: Colors.black54),
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
                                new Text("Author: " + widget.user.displayName,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black54,
                                        fontFamily: 'Lato Black')),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {}),
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
}
