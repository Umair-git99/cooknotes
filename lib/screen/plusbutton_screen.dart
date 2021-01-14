import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:cooknotes/screen/create_recipe_screen.dart';
import 'package:flutter/material.dart';

class PlusButtonScreen extends StatefulWidget {
  final User user;
  static String routeName = "/plusbutton";

  PlusButtonScreen(this.user);

  @override
  _PlusButtonScreenState createState() => _PlusButtonScreenState();
}

class _PlusButtonScreenState extends State<PlusButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/cooknotes.png'),
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
              onPressed: () => Navigator.pushNamed(context, logoutRoute,
                  arguments: widget.user),
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
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new MyCard(image: "assets/cook.png", text: "Create a new recipe"),
            new MyCard(
                image: "assets/article.png", text: "Create a new article"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, color: Colors.black45),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle_outline, color: Color(0xff00556A)),
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

class MyCard extends StatelessWidget {
  MyCard({this.image, this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Card(
        child: new InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Column(
              children: <Widget>[
                new Image.asset(image, height: 100, width: 100),
                new Text(text,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff00556A),
                        fontFamily: 'Lato Black')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
