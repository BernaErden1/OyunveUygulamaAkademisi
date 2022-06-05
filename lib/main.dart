import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:tarifim/main_page.dart';

import 'package:tarifim/splash/splash_screen.dart';

import 'package:tarifim/product/tema/dark_tema.dart';
import 'package:tarifim/product/tema/light_tema.dart';

import 'firebase/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mutfakta Neler Var ?',
      theme: LightTheme(context).lightTema,
      darkTheme: DarkTheme().darkTema,
      home: const SplashScreen(),
    );
  }
}
