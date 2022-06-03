import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';
import 'package:tarifim/Widgets/mini_header2.dart';
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
        body:
        Column(
          children: [
            BaslikBarMini2(yazi: "Tariflerim"),
            spaceSize(),
            Expanded (
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
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          fontSize: 18)),
                    subtitle: Text(mockList[index].subtitle,
                      style: TextStyle(
                          color: Colors.black54 ,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          fontSize: 13)),
                    trailing: const Icon(Icons.navigate_next_outlined),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: ColorsUtility().thirdColor);
                },
                itemCount: mockList.length,
              ),
            ),
          ],
        ));
  }
}
