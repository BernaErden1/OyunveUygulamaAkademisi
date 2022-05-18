import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);

  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  @override
  Widget build(BuildContext context) {
    final _heightone = MediaQuery.of(context).size.height * 0.2;

    final _width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: _heightone,
            width: _width,
            color: ColorsUtility().primaryColor,
            child: Center(
                child: HeadText(text: TurkceItemler().uygIsmi)),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: HeadText(
                    text: TurkceItemler().girisYap,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
