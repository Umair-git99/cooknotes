import 'dart:io' as Io;
import 'dart:convert';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/services/user_rest_service.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../dependencies.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  int _age;
  Io.File _image;
  final picker = ImagePicker();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User user;
  List<User> all;
  final userDataService = UserRestService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: userDataService.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            all = snapshot.data;
            return FutureBuilder<User>(
                future: userDataService.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    user = snapshot.data;
                    return _buildMainScreen();
                  }
                  return _buildFetchingDataScreen();
                });
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            children: <Widget>[
              SizedBox(height: 40),
              new Text('Create New Profile',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Lato Black',
                      color: new Color(0xff00556A),
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: new Container(
                    child: new Card(
                        child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      _buildImage(),
                      SizedBox(height: 30),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Text('Age:',
                                    style: new TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Lato Black',
                                        color: new Color(0xFF616161),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 30),
                                Flexible(child: _getAge()),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 35),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    color: new Color(0xff00556A),
                                    textColor: Colors.white,
                                    child: Text('Proceed'),
                                    onPressed: () {
                                      if (!_formKey.currentState.validate()) {
                                        return;
                                      }
                                      _formKey.currentState.save();
                                      print('Age: ' + _age.toString());
                                      user.age = _age;
                                      user.usertype = 'U';
                                      // user.notification = all[0].notification;
                                      Navigator.pushReplacementNamed(
                                          context, homeRoute);
                                    }),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: new Column(
        children: <Widget>[
          new Text('Profile Picture',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff515659),
                  fontFamily: 'Lato Black')),
          SizedBox(height: 10),
          (_image != null)
              ? Column(children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child: CircleAvatar(
                      radius: 40.0 - 2,
                      backgroundImage: Image.file(
                        _image,
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text('Change Image'),
                      onPressed: () {
                        _imageDialog(context);
                      })
                ])
              : InkWell(
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE6E6E6),
                    radius: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Color(0xffCCCCCC),
                    ),
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

  Widget _getAge() {
    return Container(
      width: 70.0,
      height: 40.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(2),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
          hintText: '0',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Required';
          }
        },
        onSaved: (String value) {
          _age = int.parse(value);
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
            Text('Fetching recipe... Please wait'),
          ],
        ),
      ),
    );
  }
}
