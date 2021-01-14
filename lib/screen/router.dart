import 'package:cooknotes/models/mock_user.dart';
import 'package:cooknotes/screen/constants.dart';
import 'package:cooknotes/screen/login_screen.dart';
import 'package:cooknotes/screen/plusbutton_screen.dart';
import 'package:cooknotes/screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'create_recipe_screen.dart';
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
    case plusRoute:
      return MaterialPageRoute(
        builder: (context) {
          return PlusButtonScreen(mockData[0]);
        },
      );
    case createRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return CreateRecipeScreen(mockData[0]);
        },
      );
    case createRecipeRoute:
      return MaterialPageRoute(
        builder: (context) {
          return LogoutScreen();
        },
      );
  }
}
