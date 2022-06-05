import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/firebase/models/tarif_model.dart';
import 'package:tarifim/product/utility.dart';
import '../firebase/repository/data_repository.dart';

class TarifDetail extends StatefulWidget {
  final String id;
  const TarifDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<TarifDetail> createState() => _TarifDetailState();
}

class _TarifDetailState extends State<TarifDetail> {
  final DataRepository repository = DataRepository();
  // ignore: prefer_typing_uninitialized_variables
  late final stream;

  @override
  Widget build(BuildContext context) {
    final heightone = MediaQuery.of(context).size.height * 0.7;
    final heighttwo = MediaQuery.of(context).size.height * 0.3;
    final myWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: StreamBuilder<DocumentSnapshot>(
            stream: repository.getItem(widget.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              }
              return _buildList(
                  context, snapshot.data!, heighttwo, myWidth);
            }),
      ),
    );
  }

  Widget _buildList(BuildContext context, DocumentSnapshot snapshot,
      double heighttwo, double myWidth) {
    final tarif = TarifModel.fromSnapshot(snapshot);
    final _image = tarif.image;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: heighttwo,
              width: myWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/$_image"),
                      fit: BoxFit.cover)),
            ),
            spaceSize(size: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tarif.baslik,
                  style: const TextStyle(
                      fontFamily: "Alegreya",
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (tarif.isSave == false) {
                          tarif.isSave = true;

                          repository.updatePet(tarif);
                        } else {
                          tarif.isSave = false;

                          repository.updatePet(tarif);
                        }
                      });
                    },
                    icon: !tarif.isSave
                        ? Icon(Icons.bookmark_add_outlined)
                        : Icon(Icons.bookmark_added_rounded))
              ],
            ),
            spaceSize(size: 15),
            const Divider(
              color: Colors.black,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Malzemeler",
                    style: TextStyle(
                        fontFamily: "Alegreya",
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  spaceSize(size: 15),
                  Text(tarif.malzemeler.elementAt(0).malzeme1 ?? ""),
                  Text(tarif.malzemeler.elementAt(0).malzeme2 ?? ""),
                  Text(tarif.malzemeler.elementAt(0).malzeme3 ?? ""),
                  Text(tarif.malzemeler.elementAt(0).malzeme4 ?? ""),
                  Text(tarif.malzemeler.elementAt(0).malzeme5 ?? ""),
                  Text(tarif.malzemeler.elementAt(0).malzeme6 ?? ""),
                  Text(tarif.malzemeler.elementAt(0).malzeme7 ?? ""),
                  const Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      tarif.desc,
                      style: const TextStyle(
                          fontFamily: "Alegreya",
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getTextWidgets(List<String> strings) {
    return Row(children: strings.map((item) => Text(item)).toList());
  }
}
