import 'package:flutter/material.dart';

class ColorsUtility {
  final Color primaryColor = const Color.fromARGB(255, 191, 54, 12);
  final Color secondaryColor =
      const Color.fromARGB(255, 249, 103, 58);
  final Color thirdColor = const Color.fromARGB(255, 135, 0, 0);
  final Color backgroundColor =
      const Color.fromARGB(255, 253, 253, 232);
}

Map<String, Icon> myTabItems = {
  "Anasayfa": const Icon(Icons.home_outlined),
  "Tarifler": const Icon(Icons.book_outlined),
  "Profil": const Icon(Icons.person_outlined),
  "Ayarlar": const Icon(Icons.settings_outlined)
};
