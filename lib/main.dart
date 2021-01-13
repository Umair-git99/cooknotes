//import 'package:cooknotes/models/mock_user.dart';
//import 'package:cooknotes/screen/display_recipe_screen.dart';
import 'package:cooknotes/screen/logout_screen.dart';
import 'package:cooknotes/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cook Notes Demo',
        debugShowCheckedModeBanner: false,
        home: LogOut());
    //home: DisplayRecipeScreen(mockData[0].recipe[0]));
  }
}
