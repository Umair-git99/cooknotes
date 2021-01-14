import 'dart:convert';
import 'dart:io' as Io;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateArticleScreen extends StatefulWidget {
  @override
  _CreateArticleScreenState createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  Io.File _image;
  String _articlename;
  String _articlecontent;
  final picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildImage() {
    return Container(
        child: new Column(
      children: <Widget>[
        new Text('Header Photo',
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
                  height: 200,
                  color: Colors.black12,
                  child: new Icon(Icons.add_a_photo, size: 70),
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
          fillColor: Colors.black12,
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
            return 'Articles are required';
          }
          return null;
        },
        onSaved: (String value) {
          _articlecontent = value;
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
                  color: Colors.black,
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
                            fontSize: 20.0,
                            color: Color(0xff515659),
                            fontFamily: 'Lato Black'),
                      ),
                      SizedBox(height: 10),
                      _buildArticleName(),
                      SizedBox(height: 20),
                      _buildImage(),
                      SizedBox(height: 30),
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
                            onPressed: () {},
                          ),
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

                              List<int> imageFoodBytes =
                                  _image.readAsBytesSync();
                              String base64FoodImage =
                                  base64UrlEncode(imageFoodBytes);
                              print('Image String: ' + base64FoodImage);
                              print('Article Name: ' + _articlename);
                              print('Article Content: ' + _articlecontent);
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

  Widget _buildArticleName() {
    Container(
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return 'Articles are required';
          }
          return null;
        },
        onSaved: (String value) {
          _articlename = value;
        },
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          fillColor: Colors.black12,
          filled: true,
          hintText: '10 Basic Cooking Tricks You Should Know',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
