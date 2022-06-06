import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarifim/main_page.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  _storeOnboardInfo() async {
    int isViewed = 1;
    // ignore: avoid_print
    print("Shared pref called");
    // ignore: avoid_print
    print(isViewed);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    final _heightone = MediaQuery.of(context).size.height * 0.7;
    final _heighttwo = MediaQuery.of(context).size.height * 0.3;
    final _width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: _heightone,
                    width: _width,
                    child: Image.asset(
                      "assets/onboarding3.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: _heighttwo,
                    color: ColorsUtility().primaryColor,
                    child: Padding(
                      padding: PaddingDimen().horizaontalPadding,
                      child: Column(
                        children: [
                          HeadText(
                            text: TurkceItemler().onboard3Headtext,
                          ),
                          SubText(
                              text: TurkceItemler().onboard3subtext),
                          spaceSize(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              OnboardingDot(
                                color:
                                    ColorsUtility().backgroundColor,
                              ),
                              OnboardingDot(
                                color:
                                    ColorsUtility().backgroundColor,
                              ),
                              OnboardingDot(
                                color: ColorsUtility().thirdColor,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                      Icons.navigate_before_outlined),
                                  iconSize: 60,
                                  color: ColorsUtility().thirdColor,
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _storeOnboardInfo();
                                        _navigateToMain(context);
                                      });
                                    },
                                    child: Text(
                                        TurkceItemler().letsgo,
                                        style: TextStyle(
                                            color: ColorsUtility()
                                                .backgroundColor,
                                            fontFamily: "Montserrat",
                                            fontSize: 22,
                                            fontWeight:
                                                FontWeight.w500)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _navigateToMain(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
      (route) => false);
}
