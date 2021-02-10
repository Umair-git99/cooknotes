import 'package:cooknotes/module1_screen/login_screen.dart';
import 'package:cooknotes/module1_screen/logout_screen.dart';
import 'package:cooknotes/module1_screen/register_screen.dart';
import 'package:cooknotes/module2_screen/edit_profile_screen.dart';
import 'package:cooknotes/module2_screen/home_screen.dart';
import 'package:cooknotes/module2_screen/profile_screen.dart';
import 'package:cooknotes/module2_screen/settings_screen.dart';
import 'package:cooknotes/module3_screen/create_recipe_screen.dart';
import 'package:cooknotes/module3_screen/display_recipe_screen.dart';
import 'package:cooknotes/module3_screen/plusbutton_screen.dart';
import 'package:cooknotes/module3_screen/recipelist_screen.dart';
import 'package:cooknotes/module3_screen/update_recipe_screen.dart';
import 'package:cooknotes/module4_screen/articlelist_screen.dart';
import 'package:cooknotes/module4_screen/create_article_screen.dart';
import 'package:cooknotes/module4_screen/display_article2_screen.dart';
import 'package:cooknotes/module4_screen/display_article_screen.dart';
import 'package:cooknotes/module4_screen/update_article_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {

    //MODULE 1 - LOGIN, REGISTER, LOGIN, LOGOUT
    case loginRoute:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    case registerRoute:
      return MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      );
    case logoutRoute:
      return MaterialPageRoute(builder: (context) => LogoutScreen());

    //MODULE 2 - HOME, PROFILE, SETTINGS
    case homeRoute:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case profileRoute:
      return MaterialPageRoute(
        builder: (context) {
          return ProfileScreen();
        },
      );
    case editProfileRoute:
      return MaterialPageRoute(
        builder: (context) {
          return EditProfileScreen();
        },
      );
    case settingsRoute:
      return MaterialPageRoute(
        builder: (context) {
          return SettingsScreen();
        },
      );

    //MODULE 3 - PLUSBUTTON, RECIPE
    case plusRoute:
      return MaterialPageRoute(
        builder: (context) {
          return PlusButtonScreen();
        },
      );
    case recipeListRoute:
      return MaterialPageRoute(
        builder: (context) {
          return RecipeListScreen();
        },
      );
    case displayRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return DisplayRecipeScreen();
        },
      );
    case updateRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return UpdateRecipeScreen();
        },
      );
    case createRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateRecipeScreen();
        },
      );

    //MODULE 4 - ARTICLE
    case updateArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          return UpdateArticleScreen();
        },
      );
    case displayArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          return DisplayArticleScreen();
        },
      );
    case displayArticle2Route:
      return MaterialPageRoute(
        builder: (context) {
          return DisplayArticle2Screen();
        },
      );
    case articleListRoute:
      return MaterialPageRoute(
        builder: (context) {
          return ArticleListScreen();
        },
      );
    case createArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateArticleScreen();
        },
      );
  }
}
