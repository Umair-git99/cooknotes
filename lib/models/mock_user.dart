// Create some mock data of a list of todos, as well as mock data of task list for each todo item.
// Create your own mock data.

import 'recipe.dart';
import 'user.dart';

List<User> mockData = [
  User(
      username: 'umair',
      displayName: 'Umair',
      age: 21,
      gender: 'Male',
      cookingSkill: 'Amateur',
      email: 'umair.bzk@gmail.com',
      password: 'Abc123',
      recipe: [
        Recipe(
            foodName: "Asam Pedas",
            prepHours: '0',
            prepMins: '30',
            cookHours: '1',
            cookMins: '30',
            numPerson: '5',
            ingredients: "ikan\nasam\nsantan\nbawang",
            instruction: "masak sampai sedap"),
        Recipe(
            foodName: "Chicken Lasagna",
            prepHours: '0',
            prepMins: '40',
            cookHours: '2',
            cookMins: '0',
            numPerson: '1',
            ingredients: 'chicken\nlasagna\ncheese',
            instruction: 'masak sampai sedap'),
        Recipe(
            foodName: "Ayam Goreng Crispy",
            prepHours: '0',
            prepMins: '15',
            cookHours: '0',
            cookMins: '30',
            numPerson: '4',
            ingredients: "ayam\nbawang\ntepung",
            instruction: 'masak sampai sedap'),
      ]),
];
