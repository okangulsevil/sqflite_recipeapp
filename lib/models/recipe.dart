class Recipe {
  int recipeId;
  String recipeTitle;
  String recipeMaterials;
  String recipeDescription;

  Recipe(this.recipeTitle, this.recipeMaterials, this.recipeDescription);
  Recipe.withId(this.recipeId, this.recipeTitle, this.recipeMaterials,
      this.recipeDescription);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["recipeId"] = recipeId;
    map["recipeTitle"] = recipeTitle;
    map["recipeMaterials"] = recipeMaterials;
    map["recipeDescription"] = recipeDescription;
    return map;
  }

  Recipe.fromMap(Map<String, dynamic> map) {
    this.recipeId = map["recipeId"];
    this.recipeTitle = map["recipeTitle"];
    this.recipeMaterials = map["recipeMaterials"];
    this.recipeDescription = map["recipeDescription"];
  }
}
