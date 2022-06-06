import 'package:flutter/material.dart';
import 'package:tarifim/onboarding/onboarding2.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

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
                      "assets/onboarding1.png",
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
                            text: TurkceItemler().onboard1Headtext,
                          ),
                          SubText(
                              text: TurkceItemler().onboard1subtext),
                          spaceSize(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              OnboardingDot(
                                color: ColorsUtility().thirdColor,
                              ),
                              OnboardingDot(
                                color:
                                    ColorsUtility().backgroundColor,
                              ),
                              OnboardingDot(
                                color:
                                    ColorsUtility().backgroundColor,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _navigateToOnb2(context);
                                  },
                                  icon: const Icon(
                                      Icons.navigate_next_outlined),
                                  iconSize: 60,
                                  color: ColorsUtility().thirdColor,
                                ),
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

void _navigateToOnb2(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Onboarding2()));
}
