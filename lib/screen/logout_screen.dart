import 'package:flutter/material.dart';
import 'login_screen.dart';

class LogOut extends StatefulWidget {
  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogOut> {
  Widget _buildText() {
    return Column(
      children: <Widget>[
        Text(
          'You are now Logged Out.',
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'Lato Bold',
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Thank You for using CookNotes!',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato Bold',
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Image.asset("assets/cooknotes2.png"),
          height: 400,
          width: 300,
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        // onPressed: () => print('Login Button Pressed'),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xff00556A),
        child: Text(
          'Back to Login',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            //fontWeight: FontWeight.bold,
            fontFamily: 'Lato Bold',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildImage(),
                    _buildText(),
                    _buildLoginBtn(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
