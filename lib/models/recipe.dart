import 'package:flutter/cupertino.dart';

class Recipe {
  String foodName;
  String prepHours;
  String prepMins;
  String cookHours;
  String cookMins;
  String numPerson;
  String ingredients;
  String instruction;

  Recipe(
      {this.foodName,
      this.prepHours,
      this.prepMins,
      this.cookHours,
      this.cookMins,
      this.numPerson,
      this.ingredients,
      this.instruction});

  Recipe.copy(Recipe from)
      : this(
          foodName: from.foodName,
          prepHours: from.prepHours,
          prepMins: from.prepMins,
          cookHours: from.cookHours,
          cookMins: from.cookMins,
          numPerson: from.numPerson,
          ingredients: from.ingredients,
          instruction: from.instruction,
        );
}
