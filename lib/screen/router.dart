import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:cooknotes/screen/create_profile_screen.dart';
import 'package:cooknotes/screen/login_screen.dart';
import 'package:cooknotes/screen/plusbutton_screen.dart';
import 'package:cooknotes/screen/register_screen.dart';
import 'package:cooknotes/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'create_recipe_screen.dart';
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
        builder: (context) => CreateProfileScreen(settings.arguments),
      );
    case homeRoute:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(settings.arguments, mockData),
      );
    case plusRoute:
      return MaterialPageRoute(
        builder: (context) {
          return PlusButtonScreen(mockData[0]);
        },
      );
    case createRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateRecipeScreen(settings.arguments);
        },
      );
    case logoutRoute:
      return MaterialPageRoute(
          builder: (context) => LogoutScreen(settings.arguments));
  }
}
