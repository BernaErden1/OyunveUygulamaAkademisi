import 'package:flutter/material.dart';
import 'package:tarifim/%C3%B6neriler/oneriler_view_model.dart';

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
      appBar: AppBar(
        title: Text("Öneriler"),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: bottomPadding + 15),
        child: ListView.separated(
          padding: PaddingDimen().horizaontalPadding,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {},
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
      ),
    );
  }
}
