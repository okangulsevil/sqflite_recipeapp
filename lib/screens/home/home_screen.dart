import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe.dart';
import 'package:recipebook/screens/detail/detail_screen.dart';
import 'package:recipebook/utils/dbHelper.dart';

class MyHomePage extends StatefulWidget {
  final List<Recipe> recipes;
  MyHomePage({Key key, this.recipes}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Recipe> allRecipes = [];
  int clickedRecipeIDasd;
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
      body: allRecipes.length < 1
          ? Center(
              child: Text(
                "Henüz hiç yemek tarifin yok. \n Hemen bir tarif ekle !!!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: allRecipes.length,
                        itemBuilder: (context, position) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                navigateToDetail(this.allRecipes[position]);
                              },
                              leading: Text(
                                  allRecipes[position].recipeId.toString()),
                              title: Text(allRecipes[position].recipeTitle),
                              subtitle:
                                  Text(allRecipes[position].recipeDescription),
                              trailing: GestureDetector(
                                onTap: () {
                                  _deleteRecipe(
                                      allRecipes[position].recipeId, position);
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
    );
  }

  void _deleteRecipe(int deletedRecipeId, int deletedRecipeIndex) async {
    await _databaseHelper.delete(deletedRecipeId);
    setState(() {
      getRecipes();
    });
  }

  void navigateToDetail(Recipe detailRecipe) async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(detailRecipe)));
    if (result == true) {
      getData();
    }
  }

  void getData() {
    final todosFuture = _databaseHelper.getAllRecipes();
    todosFuture.then((result) => {
          setState(() {
            allRecipes = result;
          })
        });
  }
}
