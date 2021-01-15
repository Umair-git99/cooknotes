import 'dart:io' as Io;
import 'dart:convert';
import 'package:cooknotes/models/recipe.dart';
import 'package:cooknotes/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'constants.dart';

class CreateRecipeScreen extends StatefulWidget {
  final User user;

  CreateRecipeScreen(this.user);
  @override
  _CreateRecipeScreenState createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  String _foodname;
  String imageUrl;
  Io.File _image;
  final picker = ImagePicker();
  String _prepHours;
  String _prepMins;
  String _cookHours;
  String _cookMins;
  String _numPerson;
  String _ingredients;
  String _instructions;

  int _pageIndex = 1;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFoodName() {
    return Container(
      child: TextFormField(
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: 'Asam Pedas',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Food name is required';
          }
        },
        onSaved: (String value) {
          _foodname = value;
        },
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: new Column(
        children: <Widget>[
          new Text('Food Photo',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff515659),
                  fontFamily: 'Lato Black')),
          SizedBox(height: 10),
          (_image != null)
              ? Column(children: <Widget>[
                  Image.file(_image, width: 300, height: 300),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text('Change Image'),
                      onPressed: () {
                        _imageDialog(context);
                      })
                ])
              : InkWell(
                  child: Container(
                    width: 300,
                    height: 150,
                    color: Colors.black12,
                    child: new Icon(Icons.add_a_photo, size: 70),
                  ),
                  onTap: () {
                    _imageDialog(context);
                  },
                ),
        ],
      ),
    );
  }

  Future<void> _imageDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Source: '),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  InkWell(
                    child: new Row(children: <Widget>[
                      new Icon(Icons.camera_alt),
                      SizedBox(width: 20),
                      new Text("Camera"),
                    ]),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  InkWell(
                    child: new Row(children: <Widget>[
                      new Icon(Icons.folder),
                      SizedBox(width: 20),
                      new Text("Gallery"),
                    ]),
                    onTap: () {
                      _openGallery(context);
                    },
                  )
                ],
              )));
        });
  }

  Future _openGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = Io.File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  Future _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = Io.File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  Widget _buildPrepHours() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: '0',
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: '0',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onSaved: (String value) {
          _prepHours = value;
        },
      ),
    );
  }

  Widget _buildPrepMins() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: '0',
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: '0',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onSaved: (String value) {
          _prepMins = value;
        },
      ),
    );
  }

  Widget _buildCookHours() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: '0',
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: '0',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onSaved: (String value) {
          _cookHours = value;
        },
      ),
    );
  }

  Widget _buildCookMins() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: '0',
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: '0',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onSaved: (String value) {
          _cookMins = value;
        },
      ),
    );
  }

  Widget _buildNumPerson() {
    return Container(
      //width: 60.0,
      //height: 40.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
          fillColor: Colors.black12,
          filled: true,
          hintText: '0',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Number is required';
          }
        },
        onSaved: (String value) {
          _numPerson = value;
        },
      ),
    );
  }

  Widget _buildIngredients() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: 'Insert your ingredients here',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Ingredients are required';
          }
        },
        onSaved: (String value) {
          _ingredients = value;
        },
      ),
    );
  }

  Widget _buildInstruction() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: 'Insert your instruction here',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Instruction is required';
          }
        },
        onSaved: (String value) {
          _instructions = value;
        },
      ),
    );
  }

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
          padding: const EdgeInsets.all(30.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Create A New Recipe',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
              new Container(
                  child: Divider(
                color: Colors.black,
                height: 50,
              )),
              new Form(
                key: _formKey,
                child: new Container(
                  //margin: new EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text('Food Name?',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xff515659),
                              fontFamily: 'Lato Black')),
                      SizedBox(height: 10),
                      _buildFoodName(),
                      SizedBox(height: 20),
                      _buildImage(),
                      SizedBox(height: 20),
                      new Row(children: <Widget>[
                        new Text('Preparation Time:',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Black')),
                        SizedBox(width: 10),
                        Flexible(
                          child: _buildPrepHours(),
                        ),
                        SizedBox(width: 5),
                        new Text('h',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Bold')),
                        SizedBox(width: 5),
                        Flexible(
                          child: _buildPrepMins(),
                        ),
                        SizedBox(width: 5),
                        new Text('m',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Bold')),
                      ]),
                      SizedBox(height: 10),
                      new Row(children: <Widget>[
                        new Text('Cooking Time:',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Black')),
                        SizedBox(width: 40),
                        Flexible(
                          child: _buildCookHours(),
                        ),
                        SizedBox(width: 5),
                        new Text('h',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Bold')),
                        SizedBox(width: 5),
                        Flexible(
                          child: _buildCookMins(),
                        ),
                        SizedBox(width: 5),
                        new Text('m',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Bold')),
                      ]),
                      SizedBox(height: 10),
                      new Row(children: <Widget>[
                        new Text('Serving for: ',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Black')),
                        SizedBox(width: 60),
                        Flexible(
                          child: _buildNumPerson(),
                        ),
                        SizedBox(width: 5),
                        new Text('person',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff515659),
                                fontFamily: 'Lato Bold')),
                      ]),
                      SizedBox(height: 10),
                      new Container(
                          child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                      new Text('Ingredients',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xff515659),
                              fontFamily: 'Lato Black')),
                      SizedBox(height: 10),
                      _buildIngredients(),
                      SizedBox(height: 5),
                      new Container(
                          child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                      new Text('Instruction',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xff515659),
                              fontFamily: 'Lato Black')),
                      SizedBox(height: 10),
                      _buildInstruction(),
                      SizedBox(height: 50),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                              icon: Icon(Icons.cancel, color: Colors.red),
                              iconSize: 70,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(width: 30),
                          new IconButton(
                              icon: Icon(Icons.check_circle,
                                  color: Colors.green[900]),
                              iconSize: 70,
                              onPressed: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                _formKey.currentState.save();

                                //  List<int> imageFoodBytes =
                                //      _image.readAsBytesSync();
                                //   String base64FoodImage =
                                //      base64UrlEncode(imageFoodBytes);
                                //print('Image String: ' + base64FoodImage);

                                print('Food Name: ' + _foodname);
                                print('Preparation Hours:\t\t' + _prepHours);
                                print('Preparation Minutes:\t\t' + _prepMins);
                                print('Cooking Hours:\t\t' + _cookHours);
                                print('Cooking Minutes:\t\t' + _cookMins);
                                print('Serving for (person):\t' + _numPerson);
                                print('Ingredients:\t\t' + _ingredients);
                                print('Instructions:\t\t' + _instructions);

                                Recipe newRecipe = new Recipe(
                                    foodName: _foodname,
                                    image: 'assets/pizza.jpg',
                                    prepHours: int.parse(_prepHours),
                                    prepMins: int.parse(_prepMins),
                                    cookHours: int.parse(_cookHours),
                                    cookMins: int.parse(_cookMins),
                                    numPerson: int.parse(_numPerson),
                                    ingredients: _ingredients,
                                    instruction: _instructions);

                                widget.user.recipe.add(newRecipe);

                                Navigator.pushReplacementNamed(
                                    context, homeRoute,
                                    arguments: widget.user);
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              )
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

  void _navigationTap(int index) {
    if (index == 0) {
      setState(() {
        _pageIndex = 0;
      });
      Navigator.pushReplacementNamed(context, homeRoute,
          arguments: widget.user);
    } else if (index == 1) {
      setState(() {
        _pageIndex = 1;
      });
      Navigator.pushReplacementNamed(context, plusRoute,
          arguments: widget.user);
    } else if (index == 2) {
      setState(() {
        _pageIndex = 2;
      });
      Navigator.pushReplacementNamed(context, profileRoute,
          arguments: widget.user);
    } else {
      setState(() {
        _pageIndex = index;
      });
      Navigator.pushReplacementNamed(context, settingsRoute,
          arguments: widget.user);
    }
  }
}
