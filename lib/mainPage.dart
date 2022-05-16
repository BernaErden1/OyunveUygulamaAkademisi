import 'package:flutter/material.dart';
import 'package:tarifim/anasayfa/anasayfa.dart';
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
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: _MyTabView.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabView.values.length,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: ColorsUtility().backgroundColor,
            notchMargin: 10,
            shape: CircularNotchedRectangle(),
            child: TabBar(
                tabs: _MyTabView.values
                    .map((e) => Tab(
                          text: "${e.name}",
                          icon: Icon(Icons.abc),
                        ))
                    .toList()),
          ),
        ));
  }
}

enum _MyTabView { Anasayfa, Profilim, TarifDefterim }
