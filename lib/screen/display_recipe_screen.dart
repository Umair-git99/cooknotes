import 'package:cooknotes/models/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayRecipeScreen extends StatefulWidget {
  final Recipe recipe;

  DisplayRecipeScreen(this.recipe);

  @override
  _DisplayRecipeScreenState createState() => _DisplayRecipeScreenState();
}

class _DisplayRecipeScreenState extends State<DisplayRecipeScreen> {
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
          padding: EdgeInsets.all(30),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(widget.recipe.foodName.toUpperCase(),
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Color(0xff00556A),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato Black')),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/asampedas.jpg",
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              new Container(
                  child: Divider(
                color: Colors.black,
                height: 40,
              )),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Icon(Icons.person,
                          size: 50, color: Colors.amber[800]),
                      new Text("Servings",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black')),
                      new Text(widget.recipe.numPerson + " person",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black54,
                              fontFamily: 'Lato Black'))
                    ],
                  ),
                  SizedBox(width: 40),
                  new Column(
                    children: <Widget>[
                      new Icon(Icons.kitchen, size: 50, color: Colors.red),
                      new Text("Prep Time",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black')),
                      new Text(
                          widget.recipe.prepHours +
                              " hour\n" +
                              widget.recipe.prepMins +
                              " minutes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black54,
                              fontFamily: 'Lato Black'))
                    ],
                  ),
                  SizedBox(width: 40),
                  new Column(
                    children: <Widget>[
                      new Icon(Icons.restaurant_menu,
                          size: 50, color: Colors.blue),
                      new Text("Cook Time",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xff00556A),
                              fontFamily: 'Lato Black')),
                      new Text(
                          widget.recipe.cookHours +
                              " hour \n" +
                              widget.recipe.cookMins +
                              " minutes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black54,
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
              new Text('Ingredients',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
              SizedBox(height: 10),
              new Text(widget.recipe.ingredients,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontFamily: 'Lato Black')),
              new Container(
                  child: Divider(
                color: Colors.black,
                height: 30,
              )),
              new Text('Instruction',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
              SizedBox(height: 10),
              new Text(widget.recipe.instruction,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontFamily: 'Lato Black')),
              SizedBox(height: 30),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.edit, color: Color(0xff00556A)),
                      onPressed: () {}),
                  SizedBox(width: 20),
                  new IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Delete Recipe"),
                                content: Text(
                                    "Are you sure want to delete this recipe?"),
                                actions: [
                                  FlatButton(
                                    child: Text("Yes",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xff00556A),
                                            fontFamily: 'Lato Black')),
                                    onPressed: () {
                                      Navigator.of(context).pop();
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
              )
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
