import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/recipe.dart';

import '../models/user.dart';

abstract class UserDataService {
  //User
  Future<User> addUser(User user);
  Future<User> getUser();
  Future<bool> login(String username, String password);
  Future<List<User>> getAllUser();
  //Recipe
  Future<Recipe> addRecipe(Recipe recipe);
  Future<Recipe> getRecipe();
  Future<Recipe> setRecipe(int index);
  Future<Recipe> removeRecipe(Recipe recipe);
  //Article
  Future<Article> addArticle(Article article);
  Future<Article> setArticle(int index, int i);
  Future<Article> setArticle2(int index);
  Future<Article> getArticle();
  Future<Article> removeArticle(Article article);
}
