import 'package:flutter/material.dart';
import 'package:tarifim/Widgets/mini_header2.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';

import '../product/mock_data.dart';
import '../product/utility.dart';
import '../tarif_defteri/tarif_defteri_sayfasi_view_model.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final TextEditingController _editingController =
      TextEditingController();
  late final List<TarifDefteriModel> mockList;
  final List<String> items = [];

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

    items.addAll(mockList.map((e) => e.title));
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(mockList.map((e) => e.title));
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(mockList.map((e) => e.title));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(
        children: [
          BaslikBarMini2(yazi: "Mutfakta Neler Var?"),
          spaceSize(),
          Padding(
            padding: PaddingDimen().horizaontalPadding,
            child: Column(
              children: [
                _searchField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _searchButton(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: PaddingDimen().horizaontalPadding,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        items[index],
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            fontSize: 18),
                      ),
                    );
                  },
                  separatorBuilder:
                      (BuildContext context, int index) {
                    return Divider(color: ColorsUtility().thirdColor);
                  },
                  itemCount: items.length),
            ),
          )
        ],
      ),
    );
  }

  TextField _searchField() {
    return TextField(
      controller: _editingController,
      onChanged: (value) {
        filterSearchResults(value);
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorColor: ColorsUtility().thirdColor,
      style: TextStyle(
          color: ColorsUtility().thirdColor,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat",
          fontSize: 18),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsUtility().thirdColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(20))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsUtility().primaryColor,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(20))),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsUtility().thirdColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(20))),
          labelText: "Ara",
          labelStyle: TextStyle(
            color: ColorsUtility().thirdColor,
          ),
          hintStyle: TextStyle(
            color: ColorsUtility().thirdColor,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: ColorsUtility().thirdColor,
          )),
    );
  }

  ElevatedButton _searchButton() {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize:
                MaterialStateProperty.all<Size>(const Size(75, 30)),
            backgroundColor: MaterialStateProperty.all<Color>(
                ColorsUtility().primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: ColorsUtility().thirdColor)))),
        onPressed: () {},
        child: Text(
          TurkceItemler().ara,
          style: TextStyle(
              color: ColorsUtility().backgroundColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              fontSize: 20),
        ));
  }
}
