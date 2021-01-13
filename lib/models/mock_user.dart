// Create some mock data of a list of todos, as well as mock data of task list for each todo item.
// Create your own mock data.

import 'recipe.dart';
import 'user.dart';
import 'article.dart';

List<User> mockData = [
  User(
      username: 'umair',
      displayName: 'Umair',
      profilePic: 'assets/tony.jpg',
      usertype: 'U',
      age: 21,
      gender: 'Male',
      cookingSkill: 'Amateur',
      email: 'umair.bzk@gmail.com',
      password: 'Abc123',
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
      ]),
  User(
      username: 'chefalif',
      displayName: 'Chef Alif',
      usertype: 'C',
      age: 21,
      gender: 'Male',
      cookingSkill: 'Amateur',
      email: 'chefalif@gmail.com',
      password: 'Abc123',
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
            date: "13/1/2021")
      ]),
];
