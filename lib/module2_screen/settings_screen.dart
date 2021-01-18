import 'package:cooknotes/services/user_data_service.dart';
import 'package:flutter/material.dart';
import 'package:cooknotes/models/user.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../dependencies.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen();
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _pageIndex = 3;
  User user;

  @override
  Widget build(BuildContext context) {
    final UserDataService userDataService = service();

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

  Scaffold _buildMainScreen() {
    final changeModeNotifier = Provider.of<ValueNotifier<bool>>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
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
                              )),
                        ],
                      ),
                      CheckboxGroup(
                        labels: <String>['Daily', 'Weekly', 'Never'],
                        checked: user.notification, //_notification,
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
                          user.notification = selected;
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
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      CheckboxGroup(
                        labels: <String>['Light', 'Dark'],
                        checked: user.theme,
                        onChange: (bool isChecked, String label, int index) {
                          print(
                              "isChecked: $isChecked   label: $label  index: $index");
                          if (index == 0)
                            changeModeNotifier.value = true;
                          else
                            changeModeNotifier.value = false;
                        },
                        onSelected: (List selected) => setState(() {
                          if (selected.length > 1) {
                            selected.removeAt(0);
                            print('selected length  ${selected.length}');
                          } else {
                            print("only one");
                          }
                          user.theme = selected;
                        }),
                      ),
                      SizedBox(height: 20),
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
      // Navigator.pushNamed(context, settingsRoute);
    }
  }
}
