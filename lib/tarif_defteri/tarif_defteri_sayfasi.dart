import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';

class TarifDefteriSayfasi extends StatelessWidget {
  const TarifDefteriSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TurkceItemler().tarifDefterim),
      ),
    );
  }
}
