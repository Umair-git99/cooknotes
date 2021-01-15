import 'package:flutter/material.dart';
import 'package:cooknotes/models/user.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'constants.dart';

class SettingsScreen extends StatefulWidget {
  final User user;

  SettingsScreen(this.user);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _pageIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/cooknotes.png'),
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
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Settings',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Lato Black',
                      color: new Color(0xff00556A),
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                child: new Card(
                  color: Colors.blueGrey[50],
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          new Text('Notification',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Lato Black',
                                  color: new Color(0xFF616161),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          new Text('Receive Notification',
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Lato Black',
                                  color: new Color(0xFF616161))),
                        ],
                      ),
                      CheckboxGroup(
                        labels: <String>['Daily', 'Weekly', 'Never'],
                        checked: widget.user.notification, //_notification,
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          widget.user.notification = selected;
                          print(selected.toString());
                        }),
                      ),
                      const Divider(
                        color: Color(0xFF616161),
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          new Text('Change Theme',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Lato Black',
                                  color: new Color(0xFF616161),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      CheckboxGroup(
                        labels: <String>['Light', 'Dark'],
                        checked: widget.user.theme,
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          widget.user.theme = selected;
                        }),
                      ),
                      const Divider(
                        color: Color(0xFF616161),
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          new Text('Delete Account',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Lato Black',
                                  color: new Color(0xFF616161),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          new Text(
                              'By deleting your account, you will lose all your data.',
                              style: new TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Lato Black',
                                  color: new Color(0xFF616161))),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RaisedButton(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                color: Colors.black,
                                textColor: Colors.white,
                                child: Text('Delete'),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Delete Account"),
                                          content: Text(
                                              "Are you sure you want to delete your account?"),
                                          actions: [
                                            FlatButton(
                                              child: Text("Yes",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Color(0xff00556A),
                                                      fontFamily:
                                                          'Lato Black')),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text("No",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.red,
                                                      fontFamily:
                                                          'Lato Black')),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: new Color(0xff00556A),
                          textColor: Colors.white,
                          child: Text('Save Changes'),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Your settings have been saved!",
                                        style: new TextStyle(
                                            fontSize: 25.0,
                                            fontFamily: 'Lato Black',
                                            color: new Color(0xff00556A),
                                            fontWeight: FontWeight.bold)),
                                    actions: [
                                      FlatButton(
                                        child: Icon(Icons.check_circle,
                                            size: 50,
                                            color: new Color(0xff00556A)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          }),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
      // Navigator.pushReplacementNamed(context, settingsRoute,
      //   arguments: widget.user);
    }
  }
}
