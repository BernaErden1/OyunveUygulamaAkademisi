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

class SubText extends StatelessWidget {
  final String text;
  const SubText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 2,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

class HeadText extends StatelessWidget {
  final String text;
  const HeadText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 1,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class OnboardingDot extends StatelessWidget {
  final Color color;
  const OnboardingDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }
}

class SpaceSize extends StatelessWidget {
  const SpaceSize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
    );
  }
}
