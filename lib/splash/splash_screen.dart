import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/main_page.dart';
import 'package:tarifim/onboarding/onboarding1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

int? isviewed;

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  int _start = 2;

  void shared() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onBoard');
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => isviewed != 1
                        ? const Onboarding1()
                        : const MainPage()));
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    shared();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SplashImage(),
    );
  }

  // ignore: non_constant_identifier_names
  Center _SplashImage() {
    return Center(
        child: SizedBox(
      height: _SizedBoxDimen().sHeight,
      width: _SizedBoxDimen().sWidth,
      child: Image.asset(
        "assets/splash.png",
        fit: BoxFit.cover,
      ),
    ));
  }
}

class _SizedBoxDimen {
  final double sHeight = 200;
  final double sWidth = 300;
}
