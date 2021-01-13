import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/recipe.dart';
import 'package:flutter/cupertino.dart';

class User {
  String username;
  String profilePic;
  String displayName;
  String usertype;
  int age;
  String gender;
  String cookingSkill;
  String email;
  String password;

  List<Recipe> recipe;
  List<Article> article;

  User(
      {this.username,
      this.profilePic,
      this.displayName,
      this.usertype,
      this.age,
      this.gender,
      this.cookingSkill,
      this.email,
      this.password,
      this.recipe,
      this.article});
}
