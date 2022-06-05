import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/firebase/repository/data_repository.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';
import 'package:tarifim/Widgets/mini_header2.dart';
import '../firebase/models/tarif_model.dart';
import '../tarif_detail/tarif_detail_page.dart';

class TarifDefteriSayfasi extends StatefulWidget {
  const TarifDefteriSayfasi({Key? key}) : super(key: key);

  @override
  State<TarifDefteriSayfasi> createState() =>
      _TarifDefteriSayfasiState();
}

class _TarifDefteriSayfasiState extends State<TarifDefteriSayfasi> {
  final DataRepository repository = DataRepository();
  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: Column(
      children: [
        const BaslikBarMini2(yazi: "Tariflerim"),
        spaceSize(),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: repository.getSaveItem(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              }
              return _buildList(context, snapshot.data?.docs ?? []);
            },
          ),
        ),
      ],
    ));
  }

  Widget _buildList(
      BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      children: snapshot!
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(
      BuildContext context, DocumentSnapshot snapshot) {
    final tarif = TarifModel.fromSnapshot(snapshot);
    return Card(
      margin: EdgeInsets.all(8),
      color: ColorsUtility().backgroundColor,
      elevation: 3,
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TarifDetail(id: tarif.referenceId!),
              ));
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/${tarif.image}"),
        ),
        title: Text(tarif.baslik,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
                fontSize: 18)),
        trailing: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
