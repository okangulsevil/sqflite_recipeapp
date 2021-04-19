import 'package:flutter/material.dart';
import 'package:recipebook/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}
