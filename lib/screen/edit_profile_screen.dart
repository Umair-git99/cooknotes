import 'package:cooknotes/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen(this.user);
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username;
  String _displayName;
  String _email;
  String _password;
  String _age;
  bool showPass = false;
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
              SizedBox(height: 30),
              new Text(' Edit Profile',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Lato Black',
                      color: new Color(0xff00556A),
                      fontWeight: FontWeight.bold)),
              Container(
                child: new Card(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Form(
                          key: _formKey,
                          child: new Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              CircleAvatar(
                                backgroundColor: Color(0xffE6E6E6),
                                backgroundImage: AssetImage('assets/tony.jpg'),
                                radius: 40,
                              ),
                              SizedBox(height: 10),
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Text('Change Image'),
                                  onPressed: () {}),
                              SizedBox(height: 20),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  _buildUserName(),
                                  _buildDisplayName(),
                                  SizedBox(height: 15),
                                  _buildEmail(),
                                  SizedBox(height: 15),
                                  _buildPassword(true),
                                  SizedBox(height: 15),
                                  _buildAge(),
                                  SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RaisedButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          color: new Color(0xff00556A),
                                          textColor: Colors.white,
                                          child: Text('Save Changes'),
                                          onPressed: () {
                                            if (!_formKey.currentState
                                                .validate()) {
                                              return;
                                            }
                                            _formKey.currentState.save();
                                            print('Username: ' + _username);
                                            print('Display name: ' +
                                                _displayName);
                                            print('Email: ' + _email);
                                            print('Password: ' + _password);
                                            print('Age: ' + _age);
                                          }),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ))
                            ],
                          ),
                        ))),
              )
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
            icon: new Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Color(0xff00556A)),
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

  Widget textField(String labelText, String hintText, bool isPassed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        obscureText: isPassed ? showPass : false,
        decoration: InputDecoration(
            suffixIcon: isPassed
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            labelStyle: TextStyle(
              fontSize: 25.0,
              fontFamily: 'Lato Black',
              color: new Color(0xff00556A),
              fontWeight: FontWeight.bold,
            ),
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      initialValue: widget.user.username,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: widget.user.username,
        contentPadding: EdgeInsets.only(bottom: 3),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Lato Black',
          color: new Color(0xff00556A),
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget _buildDisplayName() {
    return TextFormField(
      initialValue: widget.user.displayName,
      decoration: InputDecoration(
        labelText: 'Display Name',
        hintText: widget.user.displayName,
        contentPadding: EdgeInsets.only(bottom: 3),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Lato Black',
          color: new Color(0xff00556A),
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _displayName = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      initialValue: widget.user.email,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: widget.user.email,
          contentPadding: EdgeInsets.only(bottom: 3),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Lato Black',
            color: new Color(0xff00556A),
            fontWeight: FontWeight.bold,
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'+/=?^`{|}~-]+(?:.[a-z0-9!#$%&'+/=?^`{|}~-]+)@(?:[a-z0-9](?:[a-z0-9-][a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword(bool isPassed) {
    return TextFormField(
      initialValue: widget.user.password,
      obscureText: !showPass,
      decoration: InputDecoration(
        suffixIcon: isPassed
            ? IconButton(
                icon: Icon(Icons.remove_red_eye),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
              )
            : null,
        labelText: 'Password',
        hintText: widget.user.password,
        contentPadding: EdgeInsets.only(bottom: 3),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Lato Black',
          color: new Color(0xff00556A),
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      initialValue: widget.user.age.toString(),
      decoration: InputDecoration(
        labelText: 'Age',
        hintText: widget.user.age.toString(),
        contentPadding: EdgeInsets.only(bottom: 3),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Lato Black',
          color: new Color(0xff00556A),
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
      maxLength: 2,
      validator: (String value) {
        int _age1 = int.tryParse(value);
        if (_age1 == null || _age1 <= 0) {
          return 'Age is required';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }
}
