import 'package:flutter/material.dart';

Widget buildElevatedButton(String lblText, Function onpressedFunc) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(15),
      textStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic),
    ),
    onPressed: onpressedFunc,
    child: Text(lblText),
  );
}
