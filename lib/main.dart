import 'package:flutter/material.dart';

import 'package:tarifim/mainPage.dart';
import 'package:tarifim/product/tema/dark_tema.dart';
import 'package:tarifim/product/tema/light_tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mutfakta Neler Var ?',
      theme: LightTheme().lightTema,
      darkTheme: DarkTheme().darkTema,
      home: const MainPage(),
    );
  }
}
