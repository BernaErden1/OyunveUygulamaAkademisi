import 'package:flutter/material.dart';
import 'package:tarifim/giris_yap/giris_yap.dart';
import 'package:tarifim/onboarding/onboarding1.dart';

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
      theme: LightTheme(context).lightTema,
      darkTheme: DarkTheme().darkTema,
      home: const GirisYap(),
    );
  }
}
