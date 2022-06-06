import 'package:flutter/material.dart';
import 'package:tarifim/%C3%B6neriler/oneriler_sayfasi.dart';
import 'package:tarifim/anasayfa/anasayfa.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';
import 'package:tarifim/profil/profil_sayfasi.dart';
import 'package:tarifim/tarif_defteri/tarif_defteri_sayfasi.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: myTabItems.entries.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: DefaultTabController(
              length: myTabItems.values.length,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  child: const Icon(Icons.add_outlined),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  color: ColorsUtility().primaryColor,
                  notchMargin: 2,
                  shape: const CircularNotchedRectangle(),
                  child: TabBar(
                    controller: _tabController,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    tabs: myTabItems.entries
                        .map((e) => Tab(
                              text: e.key,
                              icon: e.value,
                            ))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Anasayfa(),
                    const TarifDefteriSayfasi(),
                    const ProfilSayfasi(),
                    const OnerilerSayfasi()
                  ],
                ),
              )),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(""),
          backgroundColor: ColorsUtility().backgroundColor,
          content: Text(
            TurkceItemler().alertMessageText,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat",
                fontSize: 15),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
