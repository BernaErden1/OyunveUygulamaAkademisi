import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/%C3%B6neriler/oneriler_view_model.dart';

import '../Widgets/mini_header.dart';
import '../product/utility.dart';

class OnerilerSayfasi extends StatefulWidget {
  const OnerilerSayfasi({Key? key}) : super(key: key);

  @override
  State<OnerilerSayfasi> createState() => _OnerilerSayfasiState();
}

class _OnerilerSayfasiState extends State<OnerilerSayfasi> {
  List<dynamic>? oneriler;
  Future<List<dynamic>> getMarker() async{
    var snapshot = await FirebaseFirestore.instance.collection('Oneriler').get();
    return snapshot.docs.map((doc) => doc.data()["OneriDesc"]).toList();
}


  @override
  void initState() {
    super.initState();
    getMarker().then((value)  {
      oneriler = value;
      print(oneriler);
      setState(() {
        
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body:
      Column(
        children: [
          BaslikBarMini(yazi: "Öneriler"),
          spaceSize(),
          Expanded(
            child: ListView.separated(
              padding: PaddingDimen().horizaontalPadding,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  title: Text(oneriler![index].toString(),
                      // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        fontSize: 18),),
                  
                  trailing: const Icon(Icons.navigate_next_outlined),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: ColorsUtility().thirdColor);
              },
              itemCount: oneriler == null ? 0 : oneriler!.length,
            ),
          ),
        ],
      ),
    );
  }
}
