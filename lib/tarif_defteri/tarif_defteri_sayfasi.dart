import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';
import 'package:tarifim/tarif_defteri/tarif_defteri_sayfasi_view_model.dart';
import 'package:tarifim/tarif_detail/tarif_detail_page.dart';

import '../product/mock_data.dart';

class TarifDefteriSayfasi extends StatefulWidget {
  const TarifDefteriSayfasi({Key? key}) : super(key: key);

  @override
  State<TarifDefteriSayfasi> createState() =>
      _TarifDefteriSayfasiState();
}

class _TarifDefteriSayfasiState extends State<TarifDefteriSayfasi> {
  late final List<TarifDefteriModel> mockList;

  @override
  void initState() {
    super.initState();
    mockList = [
      mock1,
      mock2,
      mock3,
      mock4,
      mock5,
      mock6,
      mock7,
      mock8,
      mock9,
      mock10,
      mock11
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: Text(TurkceItemler().tarifDefterim),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: bottomPadding + 15),
          child: ListView.separated(
            padding: PaddingDimen().horizaontalPadding,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TarifDetail(index: index),
                  ));
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(mockList[index].image),
                ),
                title: Text(mockList[index].title,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black,
                    )),
                subtitle: Text(mockList[index].subtitle),
                trailing: const Icon(Icons.navigate_next_outlined),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: ColorsUtility().thirdColor);
            },
            itemCount: mockList.length,
          ),
        ));
  }
}
