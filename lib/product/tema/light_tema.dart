import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarifim/product/utility.dart';

class LightTheme {
  late ThemeData lightTema;

  LightTheme() {
    lightTema = ThemeData(
        scaffoldBackgroundColor: ColorsUtility().backgroundColor,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(),
        tabBarTheme: TabBarTheme(
            labelStyle: const TextStyle(
                fontSize: 20, decorationColor: Colors.white),
            labelColor: ColorsUtility().backgroundColor,
            unselectedLabelColor: ColorsUtility().backgroundColor),
        primaryColor: ColorsUtility().primaryColor,
        indicatorColor: ColorsUtility().thirdColor,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: ColorsUtility().primaryColor,
            elevation: 1),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorsUtility().thirdColor,
            elevation: 0));
  }
}
