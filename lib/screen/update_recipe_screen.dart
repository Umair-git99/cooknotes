import 'dart:io' as Io;
import 'dart:convert';
import 'package:cooknotes/models/recipe.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/screen/recipelist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'constants.dart';

class UpdateRecipeScreen extends StatefulWidget {
  final Recipe recipe;
  final User user;

  UpdateRecipeScreen(this.recipe, this.user);
  @override
  _UpdateRecipeScreenState createState() => _UpdateRecipeScreenState();
}

class _UpdateRecipeScreenState extends State<UpdateRecipeScreen> {
  int _pageIndex = 0;
  String _foodname;
  String imageUrl;
  Io.File _image;
  final picker = ImagePicker();
  int _prepHours;
  int _prepMins;
  int _cookHours;
  int _cookMins;
  int _numPerson;
  String _ingredients;
  String _instructions;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFoodName() {
    return Container(
      child: TextFormField(
        initialValue: widget.recipe.foodName,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: widget.recipe.foodName,
          hintStyle: TextStyle(
              fontSize: 15.0, color: Colors.black, fontFamily: 'Lato Bold'),
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
                  Image.file(_image),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text('Change Image'),
                      onPressed: () {
                        _imageDialog(context);
                      })
                ])
              : Column(
                  children: [
                    Image.asset(
                      widget.recipe.image,
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text('Change Image'),
                        onPressed: () {
                          _imageDialog(context);
                        }),
                  ],
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
        initialValue: widget.recipe.prepHours.toString(),
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
          hintText: widget.recipe.prepHours.toString(),
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
          _prepHours = int.parse(value);
        },
      ),
    );
  }

  Widget _buildPrepMins() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: widget.recipe.prepMins.toString(),
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
          hintText: widget.recipe.prepMins.toString(),
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
          _prepMins = int.parse(value);
        },
      ),
    );
  }

  Widget _buildCookHours() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: widget.recipe.cookHours.toString(),
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
          hintText: widget.recipe.cookMins.toString(),
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
          _cookHours = int.parse(value);
        },
      ),
    );
  }

  Widget _buildCookMins() {
    return Container(
      width: 60.0,
      height: 40.0,
      child: TextFormField(
        initialValue: widget.recipe.cookMins.toString(),
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
          hintText: widget.recipe.cookMins.toString(),
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
          _cookMins = int.parse(value);
        },
      ),
    );
  }

  Widget _buildNumPerson() {
    return Container(
      //width: 60.0,
      //height: 40.0,
      child: TextFormField(
        initialValue: widget.recipe.numPerson.toString(),
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
          hintText: widget.recipe.numPerson.toString(),
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
          _numPerson = int.parse(value);
        },
      ),
    );
  }

  Widget _buildIngredients() {
    return Container(
      child: TextFormField(
        initialValue: widget.recipe.ingredients,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: widget.recipe.ingredients,
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
        initialValue: widget.recipe.instruction,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: widget.recipe.instruction,
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
              new Text('Update Recipe',
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
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                _formKey.currentState.save();

                                //List<int> imageFoodBytes =
                                //    _image.readAsBytesSync();
                                //String base64FoodImage =
                                //  base64UrlEncode(imageFoodBytes);
                                // print('Image String: ' + base64FoodImage);

                                print('Food Name: ' + _foodname);
                                print('Preparation Hours:\t\t' +
                                    _prepHours.toString());
                                print('Preparation Minutes:\t\t' +
                                    _prepMins.toString());
                                print('Cooking Hours:\t\t' +
                                    _cookHours.toString());
                                print('Cooking Minutes:\t\t' +
                                    _cookMins.toString());
                                print('Serving for (person):\t' +
                                    _numPerson.toString());
                                print('Ingredients:\t\t' + _ingredients);
                                print('Instructions:\t\t' + _instructions);

                                widget.recipe.foodName = _foodname;
                                widget.recipe.prepHours = _prepHours;
                                widget.recipe.prepMins = _prepMins;
                                widget.recipe.cookHours = _cookHours;
                                widget.recipe.cookMins = _cookMins;
                                widget.recipe.numPerson = _numPerson;
                                widget.recipe.ingredients = _ingredients;
                                widget.recipe.instruction = _instructions;

                                Navigator.popAndPushNamed(context, homeRoute,
                                    arguments: widget.user);

                                // print('Image:\t'+ _image);
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
