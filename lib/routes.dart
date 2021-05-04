import 'package:flutter/material.dart';
import 'package:recipebook/screens/bottom_bar.dart';
import 'package:recipebook/screens/home_screen.dart';
import 'package:recipebook/screens/add_screen.dart';

final routes = {
  "/": (BuildContext context) => BottomBarScreen(),
  "/home": (BuildContext context) => MyHomePage(),
  "/recipe_add": (BuildContext context) => RecipeAddScreen(),
};
