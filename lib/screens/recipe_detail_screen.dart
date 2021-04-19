import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe.dart';
import 'package:recipebook/utils/dbHelper.dart';

class RecipeDetailScreen extends StatefulWidget {
  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Recipe> allRecipes = List.empty();
  void getRecipes() async {
    var recipesFuture = _databaseHelper.getAllRecipes();
    await recipesFuture.then((data) {
      setState(() {
        this.allRecipes = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Tarifi Detay"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Başlık : " + allRecipes[index].recipeTitle),
            Text("Malzemeler : " + allRecipes[index].recipeMaterials),
            Text("Açıklama : " + allRecipes[index].recipeDescription),
          ],
        ),
      ),
    );
  }
}
// _controllerTitle.text = allRecipes[index].title;
// _controllerDesc.text =
//     allRecipes[index].description;
