import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe.dart';
import 'package:recipebook/utils/dbHelper.dart';

class RecipeAddScreen extends StatefulWidget {
  @override
  _RecipeAddScreenState createState() => _RecipeAddScreenState();
}

class _RecipeAddScreenState extends State<RecipeAddScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Recipe> allRecipes = List.empty();
  var _formKey = GlobalKey<FormState>();
  var _titleController = TextEditingController();
  var _materialsController = TextEditingController();
  var _descriptionController = TextEditingController();

  void _addRecipe() async {
    if (_formKey.currentState.validate()) {
      await _databaseHelper
          .insert(Recipe(_titleController.text, _materialsController.text,
              _descriptionController.text))
          .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
              context, "/", (route) => false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarif Ekle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextFormField(_titleController, "Tarif Başlığı", 1),
                  buildTextFormField(
                      _materialsController, "Tarifin Malzemeleri", 4),
                  buildTextFormField(
                      _descriptionController, "Tarifin Yapılışı", 4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    onPressed: _addRecipe,
                    child: Text("Tarifi Ekle"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(
      TextEditingController txtController, String lblText, int txtMaxLines) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: txtController,
        maxLines: txtMaxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lblText,
        ),
      ),
    );
  }
}
