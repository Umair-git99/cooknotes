import 'package:cooknotes/models/recipe.dart';
import 'package:flutter/cupertino.dart';

class User {
  String username;
  AssetImage profilePic;
  String displayName;
  int age;
  String gender;
  String cookingSkill;
  String email;
  String password;

  List<Recipe> recipe;

  User(
      {this.username,
      this.profilePic,
      this.displayName,
      this.age,
      this.gender,
      this.cookingSkill,
      this.email,
      this.password,
      this.recipe});
}
