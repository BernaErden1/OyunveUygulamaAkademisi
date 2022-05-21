import 'package:flutter/material.dart';
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
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
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
                          spaceSize(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.navigate_next_outlined),
                                iconSize: 60,
                                color: ColorsUtility().thirdColor,
                              ),
                            ],
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