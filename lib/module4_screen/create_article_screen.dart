import 'dart:convert';
import 'dart:io' as Io;
import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../dependencies.dart';

class CreateArticleScreen extends StatefulWidget {
  @override
  _CreateArticleScreenState createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  int _pageIndex = 1;
  Io.File _image;
  String _articlename;
  String _articlecontent;
  String _articleauthor;
  final picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Article article;
  final userDataService = UserRestService();

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
            children: <Widget>[
              new Text('Create A New Article',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff00556A),
                      fontFamily: 'Lato Black')),
              new Container(
                child: Divider(
                  height: 50,
                ),
              ),
              new Form(
                key: _formKey,
                child: new Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text(
                        'Article Name',
                        style:
                            TextStyle(fontSize: 20.0, fontFamily: 'Lato Black'),
                      ),
                      SizedBox(height: 10),
                      _buildArticleName(),
                      SizedBox(height: 20),
                      new Text(
                        'Author',
                        style:
                            TextStyle(fontSize: 20.0, fontFamily: 'Lato Black'),
                      ),
                      SizedBox(height: 10),
                      _buildArticleAuthor(),
                      SizedBox(height: 20),
                      _buildImage(),
                      SizedBox(height: 30),
                      new Text(
                        'Article Content',
                        style:
                            TextStyle(fontSize: 20.0, fontFamily: 'Lato Black'),
                      ),
                      SizedBox(height: 10),
                      _buildArticleContent(),
                      SizedBox(height: 50),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                            iconSize: 70,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 30),
                          new IconButton(
                            icon: Icon(Icons.check_circle,
                                color: Colors.green[900]),
                            iconSize: 70,
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              //  List<int> imageFoodBytes =
                              //     _image.readAsBytesSync();
                              //  String base64FoodImage =
                              //     base64UrlEncode(imageFoodBytes);
                              //    print('Image String: ' + base64FoodImage);
                              print('Article Name: ' + _articlename);
                              print('Article Name: ' + _articleauthor);
                              print('Article Content: ' + _articlecontent);

                              Article newArticle = new Article(
                                  title: _articlename,
                                  author: _articleauthor,
                                  image: 'assets/article3.jpg',
                                  content: _articlecontent);

                              await userDataService.addArticle(newArticle);

                              Navigator.pushReplacementNamed(
                                  context, homeRoute);
                            },
                          )
                        ],
                      ),
                    ],
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

  Widget _buildArticleName() {
    return Container(
      child: TextFormField(
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          filled: true,
          hintText: 'Article name here',
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
            return 'Article name is required';
          }
          return null;
        },
        onSaved: (String value) {
          _articlename = value;
        },
      ),
    );
  }

  Widget _buildArticleAuthor() {
    return Container(
      child: TextFormField(
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          filled: true,
          hintText: 'Author name here',
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
            return 'Author name is required';
          }
          return null;
        },
        onSaved: (String value) {
          _articleauthor = value;
        },
      ),
    );
  }

  Widget _buildImage() {
    return Container(
        child: new Column(
      children: <Widget>[
        new Text('Header Photo',
            style: TextStyle(fontSize: 20.0, fontFamily: 'Lato Black')),
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
                  child: new Icon(Icons.add_a_photo,
                      size: 70, color: Color(0xff00556A)),
                ),
                onTap: () {
                  _imageDialog(context);
                },
              )
      ],
    ));
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

  Widget _buildArticleContent() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 75.0, 20.0, 75.0),
          filled: true,
          hintText: 'Type your article here...',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Content are required';
          }
          return null;
        },
        onSaved: (String value) {
          _articlecontent = value;
        },
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
