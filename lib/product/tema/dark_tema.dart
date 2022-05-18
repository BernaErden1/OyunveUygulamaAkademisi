import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  late ThemeData darkTema;

  DarkTheme() {
    darkTema = ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 1));
  }
}
