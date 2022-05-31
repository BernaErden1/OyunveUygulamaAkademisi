import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          HeadText(
                            text: TurkceItemler().onboard3Headtext,
                          ),
                          SubText(text: TurkceItemler().onboard3subtext),
                          spaceSize(),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OnboardingDot(
                                color: ColorsUtility().backgroundColor,
                              ),
                              OnboardingDot(
                                color: ColorsUtility().backgroundColor,
                              ),
                              OnboardingDot(
                                color: ColorsUtility().thirdColor,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.navigate_before_outlined),
                                  iconSize: 60,
                                  color: ColorsUtility().thirdColor,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Başlayalım",
                                        style: TextStyle(
                                            color: ColorsUtility()
                                                .backgroundColor,
                                            fontFamily: "Montserrat",
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500))
                                )
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
