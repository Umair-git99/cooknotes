import 'package:cooknotes/screen/articlelist_screen.dart';
import 'package:cooknotes/screen/create_profile_screen.dart';
import 'package:cooknotes/screen/display_article_screen.dart';
import 'package:cooknotes/screen/display_recipe_screen.dart';
import 'package:cooknotes/screen/edit_profile_screen.dart';
import 'package:cooknotes/screen/recipelist_screen.dart';
import 'package:cooknotes/screen/update_recipe_screen.dart';

import 'package:flutter/material.dart';

import 'models/mock_user.dart';

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
        home: EditProfileScreen(mockData[0]));

    //  home: UpdateRecipeScreen(mockData[1].recipe[1]));
    //  home: DisplayRecipeScreen(mockData[1].recipe[1]));
    //home: RecipeListScreen(mockData[1]));
    //home: DisplayArticleScreen(mockData[1].article[0]));
  }
}
