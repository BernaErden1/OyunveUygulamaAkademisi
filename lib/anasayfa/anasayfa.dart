import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/Widgets/mini_header2.dart';
import 'package:tarifim/Widgets/tarif_anasayfa.dart';
import 'package:tarifim/firebase/models/tarif_model.dart';
import 'package:tarifim/firebase/repository/data_repository.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/tarif_detail/tarif_detail_page.dart';
import '../product/utility.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String araKelime = "";
  final DataRepository repository = DataRepository();
  final TextEditingController _editingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BaslikBarMini2(yazi: TurkceItemler().uygIsmi),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: araKelime == ""
                  ? repository.getStream()
                  : repository.getItemWith(araKelime),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const LinearProgressIndicator();
                }
                return _buildList(context, snapshot.data?.docs ?? []);
              },
            ),
          )
        ],
      ),
    );
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

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TarifDetail(id: tarif.referenceId!),
            ));
      },
      child: TarifCard(
        baslik: tarif.baslik,
        desc: tarif.desc,
        image: tarif.image,
        malzemeler: tarif.malzemeler,
        isSave: tarif.isSave,
      ),
    );
  }

  TextField _searchField() {
    return TextField(
      controller: _editingController,
      onChanged: (value) {
        araKelime = value;
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
              borderRadius: MyRadius().borderRad),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsUtility().primaryColor,
              ),
              borderRadius: MyRadius().borderRad),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsUtility().thirdColor),
              borderRadius: MyRadius().borderRad),
          labelText: TurkceItemler().ara,
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
                    borderRadius: MyRadius().borderRad,
                    side: BorderSide(
                        color: ColorsUtility().thirdColor)))),
        onPressed: () {
          setState(() {});
        },
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
