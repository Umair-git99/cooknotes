import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/screen/articlelist_screen.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:cooknotes/screen/create_profile_screen.dart';
import 'package:cooknotes/screen/display_recipe_screen.dart';
import 'package:cooknotes/screen/login_screen.dart';
import 'package:cooknotes/screen/plusbutton_screen.dart';
import 'package:cooknotes/screen/profile_screen.dart';
import 'package:cooknotes/screen/recipelist_screen.dart';
import 'package:cooknotes/screen/register_screen.dart';
import 'package:cooknotes/screen/settings_screen.dart';
import 'package:cooknotes/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'create_recipe_screen.dart';
import 'display_article_screen.dart';
import 'home_screen.dart';
import 'logout_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case loginRoute:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(mockData),
      );
    case registerRoute:
      return MaterialPageRoute(
        builder: (context) => RegisterScreen(mockData),
      );
    case createProfileRoute:
      return MaterialPageRoute(
        builder: (context) => CreateProfileScreen(settings.arguments, mockData),
      );
    case homeRoute:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(settings.arguments, mockData),
      );
    case recipeListRoute:
      return MaterialPageRoute(
        builder: (context) {
          return RecipeListScreen(settings.arguments);
        },
      );
    case displayArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          DisplayArguments argument = settings.arguments;
          return DisplayArticleScreen(argument.article, argument.user);
        },
      );
    case profileRoute:
      return MaterialPageRoute(
        builder: (context) {
          return ProfileScreen(settings.arguments);
        },
      );
    case settingsRoute:
      return MaterialPageRoute(
        builder: (context) {
          return SettingsScreen(settings.arguments);
        },
      );
    case articleListRoute:
      return MaterialPageRoute(
        builder: (context) {
          return ArticleListScreen(settings.arguments);
        },
      );
    case displayRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return DisplayRecipeScreen(settings.arguments);
        },
      );
    case plusRoute:
      return MaterialPageRoute(
        builder: (context) {
          return PlusButtonScreen(settings.arguments);
        },
      );
    case createRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateRecipeScreen(settings.arguments);
        },
      );
    case logoutRoute:
      return MaterialPageRoute(builder: (context) => LogoutScreen());
  }
}
