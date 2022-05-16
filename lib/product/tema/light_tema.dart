import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarifim/product/utility.dart';

class LightTheme {
  late ThemeData lightTema;

  LightTheme() {
    lightTema = ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(),
        tabBarTheme: TabBarTheme(
            labelColor: ColorsUtility().thirdColor,
            unselectedLabelColor: ColorsUtility().primaryColor),
        primaryColor: ColorsUtility().primaryColor,
        indicatorColor: ColorsUtility().thirdColor,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 1),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorsUtility().primaryColor,
            elevation: 0));
  }
}
