import 'package:flutter/material.dart';
import 'package:recipebook/screens/bottomBar/bottom_bar.dart';
import 'package:recipebook/screens/home/home_screen.dart';
import 'package:recipebook/screens/add/add_screen.dart';

final routes = {
  "/": (BuildContext context) => BottomBarScreen(),
  "/home": (BuildContext context) => MyHomePage(),
  "/recipe_add": (BuildContext context) => RecipeAddScreen(),
};
