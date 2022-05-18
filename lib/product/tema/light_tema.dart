import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarifim/product/utility.dart';

class LightTheme {
  final BuildContext context;
  late ThemeData lightTema;

  LightTheme(this.context) {
    lightTema = ThemeData(
        fontFamily: "Alegraya",
        textTheme: Theme.of(context).textTheme.copyWith(
              headline4:
                  TextStyle(color: ColorsUtility().backgroundColor),
              subtitle1: TextStyle(
                  color: ColorsUtility().backgroundColor,
                  fontSize: 18),
            ),
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
