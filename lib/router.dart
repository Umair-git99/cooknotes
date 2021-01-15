import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/module1_screen/login_screen.dart';
import 'package:cooknotes/module1_screen/logout_screen.dart';
import 'package:cooknotes/module1_screen/register_screen.dart';
import 'package:cooknotes/module2_screen/create_profile_screen.dart';
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
        builder: (context) => LoginScreen(mockData),
      );
    case registerRoute:
      return MaterialPageRoute(
        builder: (context) => RegisterScreen(mockData),
      );
    case logoutRoute:
      return MaterialPageRoute(builder: (context) => LogoutScreen());

    //MODULE 2 - HOME, PROFILE, SETTINGS
    case createProfileRoute:
      return MaterialPageRoute(
        builder: (context) => CreateProfileScreen(settings.arguments, mockData),
      );
    case homeRoute:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(settings.arguments, mockData),
      );
    case profileRoute:
      return MaterialPageRoute(
        builder: (context) {
          return ProfileScreen(settings.arguments);
        },
      );
    case editProfileRoute:
      return MaterialPageRoute(
        builder: (context) {
          return EditProfileScreen(settings.arguments);
        },
      );
    case settingsRoute:
      return MaterialPageRoute(
        builder: (context) {
          return SettingsScreen(settings.arguments);
        },
      );

    //MODULE 3 - PLUSBUTTON, RECIPE
    case plusRoute:
      return MaterialPageRoute(
        builder: (context) {
          return PlusButtonScreen(settings.arguments);
        },
      );
    case recipeListRoute:
      return MaterialPageRoute(
        builder: (context) {
          return RecipeListScreen(settings.arguments);
        },
      );
    case displayRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          DisplayRecipeArguments argument = settings.arguments;
          return DisplayRecipeScreen(argument.recipe, argument.user);
        },
      );
    case updateRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          UpdateRecipeArguments argument = settings.arguments;
          return UpdateRecipeScreen(argument.recipe, argument.user);
        },
      );
    case createRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateRecipeScreen(settings.arguments);
        },
      );

    //MODULE 4 - ARTICLE
    case updateArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          UpdateArticleArguments argument = settings.arguments;
          return UpdateArticleScreen(argument.article, argument.user);
        },
      );
    case displayArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          DisplayArticleArguments argument = settings.arguments;
          return DisplayArticleScreen(argument.article, argument.user);
        },
      );
    case displayArticle2Route:
      return MaterialPageRoute(
        builder: (context) {
          DisplayArticle2Arguments argument = settings.arguments;
          return DisplayArticle2Screen(argument.article, argument.user);
        },
      );
    case articleListRoute:
      return MaterialPageRoute(
        builder: (context) {
          return ArticleListScreen(settings.arguments);
        },
      );
    case createArticleRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateArticleScreen(settings.arguments);
        },
      );
  }
}
