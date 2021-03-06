import 'dart:convert';
import 'dart:io' as Io;
import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import 'package:cooknotes/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../dependencies.dart';

class UpdateArticleScreen extends StatefulWidget {
  @override
  _UpdateArticleScreenState createState() => _UpdateArticleScreenState();
}

class _UpdateArticleScreenState extends State<UpdateArticleScreen> {
  int _pageIndex = 0;
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
            padding: const EdgeInsets.all(30.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text('Edit Article',
                    style: TextStyle(
                        fontSize: 30.0,
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
                          'Post Title',
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'Lato Black'),
                        ),
                        SizedBox(height: 10),
                        _buildArticleName(),
                        SizedBox(height: 10),
                        new Text(
                          'Author',
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'Lato Black'),
                        ),
                        SizedBox(height: 10),
                        _buildArticleAuthor(),
                        SizedBox(height: 20),
                        _buildImage(),
                        SizedBox(height: 30),
                        new Text(
                          'Content',
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'Lato Black'),
                        ),
                        SizedBox(height: 20),
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
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                _formKey.currentState.save();

                                // List<int> imageFoodBytes =
                                //     _image.readAsBytesSync();
                                // String base64FoodImage =
                                //   base64UrlEncode(imageFoodBytes);
                                // print('Image String: ' + base64FoodImage);
                                print('Article Name: ' + _articlename);
                                print('Article Content: ' + _articleauthor);
                                print('Article Content: ' + _articlecontent);
                                article.title = _articlename;
                                article.author = _articleauthor;
                                article.content = _articlecontent;

                                final updatedUser =
                                    await userDataService.updateUser();
                                userDataService.setUser(updatedUser);

                                Navigator.popAndPushNamed(context, homeRoute);
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
        bottomNavigationBar: Navbar(_pageIndex));
  }

  Widget _buildArticleName() {
    return Container(
      child: TextFormField(
        initialValue: article.title,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          filled: true,
          hintText: article.title,
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
          _articlename = value;
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
                  Image.asset(article.image, width: 200, height: 200),
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
        initialValue: article.content,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 75.0, 20.0, 75.0),
          filled: true,
          hintText: article.content,
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
            return 'Articles are required';
          }
        },
        onSaved: (String value) {
          _articlecontent = value;
        },
      ),
    );
  }

  Widget _buildArticleAuthor() {
    return Container(
      child: TextFormField(
        initialValue: article.author,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          filled: true,
          hintText: article.author,
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
        },
        onSaved: (String value) {
          _articleauthor = value;
        },
      ),
    );
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
