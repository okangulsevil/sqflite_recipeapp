import 'package:flutter/material.dart';

Widget buildTextFormField(TextEditingController txtController, String lblText,
    String validateText, int txtMaxLines) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: TextFormField(
      style: TextStyle(fontSize: 20),
      controller: txtController,
      validator: (value) {
        if (value.isEmpty) return validateText;
      },
      maxLines: txtMaxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: lblText,
      ),
    ),
  );
}
