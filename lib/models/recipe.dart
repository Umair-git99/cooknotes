class Recipe {
  String foodName;
  String image;
  int prepHours;
  int prepMins;
  int cookHours;
  int cookMins;
  int numPerson;
  String ingredients;
  String instruction;

  Recipe(
      {this.foodName,
      this.image,
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
          image: from.image,
          prepHours: from.prepHours,
          prepMins: from.prepMins,
          cookHours: from.cookHours,
          cookMins: from.cookMins,
          numPerson: from.numPerson,
          ingredients: from.ingredients,
          instruction: from.instruction,
        );
}
