import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:tarifim/anasayfa/anasayfa.dart';
import 'package:tarifim/auth_controller.dart';
import 'package:tarifim/giris_yap/giris_yap.dart';
import 'package:tarifim/kayit_ol/kayit_ol.dart';
import 'package:tarifim/main_page.dart';
import 'package:tarifim/onboarding/onboarding1.dart';
import 'package:tarifim/onboarding/onboarding2.dart';
import 'package:tarifim/onboarding/onboarding3.dart';
import 'package:tarifim/splash/splash_screen.dart'; 

import 'package:tarifim/product/tema/dark_tema.dart';
import 'package:tarifim/product/tema/light_tema.dart';
import 'package:tarifim/profil/profil_sayfasi.dart';
import 'package:tarifim/sifremi_unuttum/sifremi_unuttum.dart';
import 'package:tarifim/tarif_defteri/tarif_defteri_sayfasi.dart';
import 'package:tarifim/tarif_defteri/tarif_defteri_sayfasi_view_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp().then((value)=> Get.put(AuthController()));

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