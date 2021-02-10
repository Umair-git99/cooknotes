import 'package:cooknotes/models/article.dart';
import 'package:cooknotes/models/recipe.dart';
import 'package:cooknotes/models/user.dart';
import 'package:cooknotes/services/rest_service.dart';
import 'package:cooknotes/services/user_data_service.dart';
import 'package:cooknotes/dependencies.dart';

class UserRestService implements UserDataService {
  static final UserRestService _instance = UserRestService._constructor();
  factory UserRestService() {
    return _instance;
  }

  UserRestService._constructor();
  final rest = service<RestService>();

  User currentUser;
  Recipe currentRecipe;
  Article currentArticle;

  Future<User> addUser(User user) async {
    final json = await rest.post('users/', data: user);
    currentUser = user;
    return User.fromJson(json);
  }

  Future<User> getUser() async {
    return currentUser;
  }

  Future<User> setUser(User user) async {
    currentUser = user;
  }

  Future<User> updateUser() async {
    User user = await getUser();
    String id = user.id;

    final json = await rest.patch('users/$id', data: user);
    return User.fromJson(json);
  }

  Future<List<User>> getAllUser() async {
    final listJson = await rest.get('users');
    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  Future<bool> login(String username, String password) async {
    List<User> all = await getAllUser();
    for (var u in all) {
      if (username == u.username && password == u.password) {
        currentUser = u;
        return true;
      }
    }
    return false;
  }

  Future<Recipe> addRecipe(Recipe recipe) {
    currentUser.recipe.add(recipe);
  }

  Future<Recipe> getRecipe() async {
    return currentRecipe;
  }

  Future<Recipe> setRecipe(int index) {
    currentRecipe = currentUser.recipe[index];
  }

  Future<Recipe> removeRecipe(Recipe recipe) {
    currentUser.recipe.remove(recipe);
  }

  Future<Article> addArticle(Article article) {
    currentUser.article.add(article);
  }

  Future<Article> getArticle() async {
    return currentArticle;
  }

  Future<Article> setArticle(int index, int i) async {
    List<User> all = await getAllUser();
    currentArticle = all[index].article[i];
  }

  Future<Article> setArticle2(int index) {
    currentArticle = currentUser.article[index];
  }

  Future<Article> removeArticle(Article article) {
    currentUser.article.remove(article);
  }
}
