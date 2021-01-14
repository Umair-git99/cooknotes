import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  final List<User> all;

  RegisterScreen(this.all);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  String _displayname;
  String _username;
  String _password;
  String _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildDisplayNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xff00556A),
                  ),
                  onPressed: null),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Display Name is required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _displayname = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Display Name',
                          hintStyle: TextStyle(
                            color: Color(0xff00556A),
                            fontFamily: 'Lato',
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xff00556A),
                  ),
                  onPressed: null),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _username = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Color(0xff00556A),
                            fontFamily: 'Lato',
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.lock,
                    color: Color(0xff00556A),
                  ),
                  onPressed: null),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextFormField(
                        obscureText: true,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _password = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xff00556A),
                            fontFamily: 'Lato',
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.mail,
                    color: Color(0xff00556A),
                  ),
                  onPressed: null),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _email = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color(0xff00556A),
                            fontFamily: 'Lato',
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('Register Button Pressed');
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();

          User newUser = new User(
              username: _username,
              displayName: _displayname,
              password: _password,
              email: _email);

          widget.all.add(newUser);

          Navigator.pushReplacementNamed(context, createProfileRoute,
              arguments: newUser);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xff00556A),
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Row(
      children: <Widget>[
        Text(
          '     Already have an account ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        TextButton(
            child: Text(
              'Login',
              style: TextStyle(
                color: Color(0xff00556A),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, loginRoute);
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Container(
                //height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xff00556A),
                          fontFamily: 'Lato Bold',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _buildDisplayNameTF(),
                      _buildUsernameTF(),
                      _buildPasswordTF(),
                      _buildEmailTF(),
                      _buildRegisterBtn(),
                      _buildLoginText(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
