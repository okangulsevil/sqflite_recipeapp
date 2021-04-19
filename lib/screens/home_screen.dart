import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe.dart';
import 'package:recipebook/utils/dbHelper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Recipe> allRecipes = List.empty();
  int clickedRecipeID;

  void getRecipes() async {
    var recipesFuture = _databaseHelper.getAllRecipes();
    await recipesFuture.then((data) {
      setState(() {
        this.allRecipes = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yemek Tarifleri"),
      ),
      body: allRecipes.length <= 0
          ? Center(
              child: Text(
                  "Henüz hiç yemek tarifin yok. \n Hemen bir tarif ekle !!!"),
            )
          : Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: allRecipes.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  // _controllerTitle.text = allRecipes[index].title;
                                  // _controllerDesc.text =
                                  //     allRecipes[index].description;
                                  clickedRecipeID = allRecipes[index].recipeId;
                                  Navigator.pushNamed(
                                      context, "/recipe_detail");
                                });
                              },
                              title: Text(allRecipes[index].recipeTitle),
                              subtitle:
                                  Text(allRecipes[index].recipeDescription),
                              trailing: GestureDetector(
                                onTap: () {
                                  _deleteRecipe(
                                      allRecipes[index].recipeId, index);
                                },
                                child: Icon(Icons.delete),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddRecipe,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _goToAddRecipe() {
    Navigator.pushNamedAndRemoveUntil(context, "/recipe_add", (route) => false);
  }

  void _deleteRecipe(int deletedRecipeId, int deletedRecipeIndex) async {
    await _databaseHelper.delete(deletedRecipeId);
    setState(() {
      getRecipes();
    });
  }
}
