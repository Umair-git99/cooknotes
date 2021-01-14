import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/models/user.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  final List<User> all;

  RegisterScreen(this.all);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
//  bool _rememberMe = false;
  String displayName;
  String userName;
  String displayPassword;
  String displayRePassword;
  String displayEmail;

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
                      child: TextField(
                        onChanged: (value) => displayName = value,
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
                      child: TextField(
                        onChanged: (value) => userName = value,
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
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) => displayPassword = value,
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

  Widget _buildRePasswordTF() {
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
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) => displayRePassword = value,
                        decoration: InputDecoration(
                          hintText: 'Re-enter Password',
                          hintStyle: TextStyle(
                            color: Color(0xff00556A),
                            fontFamily: 'Lato ',
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
                      child: TextField(
                        onChanged: (value) => displayEmail = value,
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
        onPressed: () => print('Register Button Pressed'),
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => LoginScreen(widget.all)));
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    _buildRePasswordTF(),
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
    );
  }
}
