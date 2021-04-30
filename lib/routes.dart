import 'package:flutter/material.dart';
import 'package:recipebook/screens/home_screen.dart';
import 'package:recipebook/screens/recipe_add_screen.dart';

final routes = {
  "/": (BuildContext context) => MyHomePage(),
  "/recipe_add": (BuildContext context) => RecipeAddScreen(),
};
