import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/screen/recipelist_screen.dart';
import 'package:flutter/material.dart';
//import 'screen/plusbutton_screen.dart';
//import 'screen/splash_screen.dart';
//import 'package:splashscreen/splashscreen.dart';

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
        //home: PlusButtonScreen(),
        home: RecipeListScreen(mockData[0]));
  }
}
