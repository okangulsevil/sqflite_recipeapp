import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;
  RecipeDetailScreen(this.recipe);

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState(recipe);
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  Recipe recipe;
  _RecipeDetailScreenState(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Tarifi Detay"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Başlık : " + recipe.recipeTitle,
                style: TextStyle(fontSize: 25),
              ),
              Text("Malzemeler : " + recipe.recipeMaterials,
                  style: TextStyle(fontSize: 25)),
              Text("Açıklama : " + recipe.recipeDescription,
                  style: TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
// _controllerTitle.text = allRecipes[index].title;
// _controllerDesc.text =
//     allRecipes[index].description;
