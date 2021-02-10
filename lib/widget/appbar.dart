import 'package:cooknotes/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
    );
  }
}
