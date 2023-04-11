import 'package:flutter/material.dart';

class MySnackbar {
  static void show(
    BuildContext context,
    String text,
  ) {
    FocusScope.of(context).requestFocus(FocusNode());

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: 350,
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
      elevation: 3.0,
    ));
  }
}
