import 'package:flutter/material.dart';
import 'package:recipebook/models/recipe.dart';
import 'package:recipebook/utils/dbHelper.dart';
import 'package:recipebook/widget/buildElevatedButton.dart';
import 'package:recipebook/widget/buildTextFormField.dart';

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
                  buildTextFormField(
                      _titleController, "Tarif Başlığı", "Başlık Gerekli", 1),
                  buildTextFormField(_materialsController,
                      "Tarifin Malzemeleri", "Malzeme Bilgisi Gerekli", 4),
                  buildTextFormField(_descriptionController, "Tarifin Yapılışı",
                      "Tarifin Yapılışı Gerekli", 4),
                  buildElevatedButton("Tarif Ekle", _addRecipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
