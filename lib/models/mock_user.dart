// Create some mock data of a list of todos, as well as mock data of task list for each todo item.
// Create your own mock data.

import 'package:cooknotes/services/user_data_service.dart';

import 'recipe.dart';
import 'user.dart';
import 'article.dart';

List<User> mockData = [
  User(
      username: 'umair',
      displayName: 'Umair Hamzah',
      profilePic: 'assets/tony.jpg',
      usertype: 'U',
      age: 21,
      email: 'umair.bzk@gmail.com',
      password: 'Abc123',
      notification: [
        'Weekly'
      ],
      theme: [
        'Light'
      ],
      recipe: [
        Recipe(
            foodName: "Asam Pedas",
            image: 'assets/asampedas.jpg',
            prepHours: 0,
            prepMins: 30,
            cookHours: 1,
            cookMins: 30,
            numPerson: 5,
            ingredients: "ikan\nasam\nsantan\nbawang",
            instruction: "masak sampai sedap"),
        Recipe(
            foodName: "Chicken Lasagna",
            image: 'assets/chickenlasagna.jpg',
            prepHours: 0,
            prepMins: 40,
            cookHours: 2,
            cookMins: 0,
            numPerson: 1,
            ingredients: 'chicken\nlasagna\ncheese',
            instruction: 'masak sampai sedap'),
        Recipe(
            foodName: "Ayam Goreng Crispy",
            image: 'assets/ayamgoreng.jpg',
            prepHours: 0,
            prepMins: 15,
            cookHours: 0,
            cookMins: 30,
            numPerson: 4,
            ingredients: "ayam\nbawang\ntepung",
            instruction: 'masak sampai sedap'),
        Recipe(
            foodName: "Ikan Siakap Tiga Rasa",
            image: 'assets/siakap.jpg',
            prepHours: 0,
            prepMins: 40,
            cookHours: 2,
            cookMins: 0,
            numPerson: 1,
            ingredients: 'ikan\nsos\ntepung jagung',
            instruction: 'masak sampai sedap ye!'),
      ]),
  User(
      username: 'chefsyam',
      displayName: 'Chef Syam',
      profilePic: 'assets/gordon.jpg',
      usertype: 'C',
      age: 21,
      email: 'chefsyam@gmail.com',
      password: 'abc123',
      notification: [
        'Daily'
      ],
      theme: [
        'Light'
      ],
      recipe: [
        Recipe(
            foodName: "Asam Pedas",
            image: 'assets/asampedas.jpg',
            prepHours: 0,
            prepMins: 30,
            cookHours: 1,
            cookMins: 30,
            numPerson: 5,
            ingredients: "ikan\nasam\nsantan\nbawang",
            instruction: "masak sampai sedap tau!"),
        Recipe(
            foodName: "Ikan Siakap Tiga Rasa",
            image: 'assets/siakap.jpg',
            prepHours: 0,
            prepMins: 40,
            cookHours: 2,
            cookMins: 0,
            numPerson: 1,
            ingredients: 'ikan\nsos\ntepung jagung',
            instruction: 'masak sampai sedap ye!'),
      ],
      article: [
        Article(
          title: "10 Basic Cooking Tricks You Should Know",
          image: "assets/article1.png",
          author: "Chef Syam",
          content: "1. \tDon't overcrowd the pan.\n" +
              "2. \tLet red meat sit before cutting into it\n" +
              "3. \tStore spices in the right location.\n" +
              "4. \tShut the stove off before eggs are done.\n" +
              "5. \tChop herbs with salt.\n" +
              "6. \tAdd salt to boiling pasta water.\n" +
              "7. \tUse pasta water to create a pasta sauce.\n" +
              "8. \tAlways keep a few essentials on hand.\n" +
              "9. \tUse a paper towel to preserve vegetables.\n" +
              "10. \t10. Keep the root of the onion intact to help with slicing.",
        ),
        Article(
          title: "10 Cara Memasak Bagi Amatur",
          image: "assets/article2.jpg",
          author: "Chef Syam",
          content: "1. \tDon't overcrowd the pan.\n" +
              "2. \tLet red meat sit before cutting into it\n" +
              "3. \tStore spices in the right location.\n" +
              "4. \tShut the stove off before eggs are done.\n" +
              "5. \tChop herbs with salt.\n" +
              "6. \tAdd salt to boiling pasta water.\n" +
              "7. \tUse pasta water to create a pasta sauce.\n" +
              "8. \tAlways keep a few essentials on hand.\n" +
              "9. \tUse a paper towel to preserve vegetables.\n" +
              "10. \t10. Keep the root of the onion intact to help with slicing.",
        )
      ]),
  User(
      username: 'chefalif',
      displayName: 'Chef Alif',
      profilePic: 'assets/gordon.jpg',
      usertype: 'C',
      age: 21,
      email: 'chefalif@gmail.com',
      password: 'abc123',
      notification: [
        'Daily'
      ],
      theme: [
        'Light'
      ],
      recipe: [
        Recipe(
            foodName: "Asam Pedas",
            image: 'assets/asampedas.jpg',
            prepHours: 0,
            prepMins: 30,
            cookHours: 1,
            cookMins: 30,
            numPerson: 5,
            ingredients: "ikan\nasam\nsantan\nbawang",
            instruction: "masak sampai sedap tau!"),
        Recipe(
            foodName: "Ikan Siakap Tiga Rasa",
            image: 'assets/siakap.jpg',
            prepHours: 0,
            prepMins: 40,
            cookHours: 2,
            cookMins: 0,
            numPerson: 1,
            ingredients: 'ikan\nsos\ntepung jagung',
            instruction: 'masak sampai sedap ye!'),
      ],
      article: [
        Article(
          title: "10 Tips Paling Berkesan Di Dapur",
          image: "assets/article4.jpg",
          author: "Chef Alif",
          content: "1. \tDon't overcrowd the pan.\n" +
              "2. \tLet red meat sit before cutting into it\n" +
              "3. \tStore spices in the right location.\n" +
              "4. \tShut the stove off before eggs are done.\n" +
              "5. \tChop herbs with salt.\n" +
              "6. \tAdd salt to boiling pasta water.\n" +
              "7. \tUse pasta water to create a pasta sauce.\n" +
              "8. \tAlways keep a few essentials on hand.\n" +
              "9. \tUse a paper towel to preserve vegetables.\n" +
              "10. \t10. Keep the root of the onion intact to help with slicing.",
        ),
      ]),
];

class UserDataServiceMock implements UserDataService {
  User currentUser;
  Recipe currentRecipe;
  Article currentArticle;

  Future<User> addUser(User user) {
    mockData.add(user);
    currentUser = user;
  }

  Future<User> getUser() async {
    return currentUser;
  }

  List<User> getAllUser() {
    return mockData;
  }

  Future<bool> login(String username, String password) async {
    int index;
    for (index = 0; index < mockData.length; index++) {
      if (username == mockData[index].username &&
          password == mockData[index].password) {
        currentUser = mockData[index];
        return true;
      }
    }
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

  Future<Article> setArticle(int index, int i) {
    currentArticle = mockData[index].article[i];
  }

  Future<Article> setArticle2(int index) {
    currentArticle = currentUser.article[index];
  }

  Future<Article> removeArticle(Article article) {
    currentUser.article.remove(article);
  }
}
