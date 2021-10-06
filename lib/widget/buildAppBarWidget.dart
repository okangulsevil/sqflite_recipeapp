import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String titleText, bool leadingBool) {
  return AppBar(
    leading: leadingBool
        ? BackButton(
            color: Theme.of(context).primaryColor,
          )
        : null,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          icon: Icon(
            CupertinoIcons.moon_stars,
            color: Colors.red,
          ),
          onPressed: () {}),
    ],
    title: Text(
      titleText,
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
  );
}
