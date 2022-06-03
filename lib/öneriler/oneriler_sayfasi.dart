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
  late final List<OnerilerModel> mockList;
  final mock = Mock();

  @override
  void initState() {
    super.initState();
    mockList = [
      mock.mock1,
      mock.mock2,
      mock.mock3,
      mock.mock4,
    ];
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
                  title: Text(mockList[index].title,
                      // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        fontSize: 18),),
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
      ),
    );
  }
}
