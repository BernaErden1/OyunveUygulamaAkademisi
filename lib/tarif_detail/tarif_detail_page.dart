import 'package:flutter/material.dart';
import 'package:tarifim/product/mock_data.dart';
import 'package:tarifim/product/utility.dart';

class TarifDetail extends StatelessWidget {
  const TarifDetail({
    Key? key,
    required int index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _heightone = MediaQuery.of(context).size.height * 0.7;
    final _heighttwo = MediaQuery.of(context).size.height * 0.3;
    final _width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: _heighttwo,
                    width: _width,
                    child: Image.asset(
                      mock1.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: _heightone,
                    child: Padding(
                      padding: PaddingDimen().horizaontalPadding,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: [
                            spaceSize(),
                            Text(
                              mock1.title,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 50),
                            ),
                            Text(mock1.subtitle,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 30)),
                            spaceSize(),
                            const Divider(
                              color: Colors.black,
                            ),
                            const Text("Malzemeler",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 30)),
                            const Text("Bonfile et"
                                '\n'
                                "Domates\n"
                                "Biberiye"),
                            spaceSize(),
                            const Divider(
                              color: Colors.black,
                            ),
                            const Text(
                                "dsadsdasdlkasdmsadkasdmaskdaskdsamdksadmlasdmkasmkdlasmdksamdlasdmkasldasmdlsadsadsadkmdskflkdfldfldf\ndsadasdlsdalsdösl\ndsdf\nasdsadasdsa|\ndsadnjakdnasjdsandkjsadnasjdnaskdsankjdsajndkasdkjsandsajkdnasjkd"),
                            const Text(
                                "dsadsdasdlkasdmsadkasdmaskdaskdsamdksadmlasdmkasmkdlasmdksamdlasdmkasldasmdlsadsadsadkmdskflkdfldfldf\ndsadasdlsdalsdösl\ndsdf\nasdsadasdsa|\ndsadnjakdnasjdsandkjsadnasjdnaskdsankjdsajndkasdkjsandsajkdnasjkd"),
                            const Text(
                                "dsadsdasdlkasdmsadkasdmaskdaskdsamdksadmlasdmkasmkdlasmdksamdlasdmkasldasmdlsadsadsadkmdskflkdfldfldf\ndsadasdlsdalsdösl\ndsdf\nasdsadasdsa|\ndsadnjakdnasjdsandkjsadnasjdnaskdsankjdsajndkasdkjsandsajkdnasjkd"),
                            const Text(
                                "dsadsdasdlkasdmsadkasdmaskdaskdsamdksadmlasdmkasmkdlasmdksamdlasdmkasldasmdlsadsadsadkmdskflkdfldfldf\ndsadasdlsdalsdösl\ndsdf\nasdsadasdsa|\ndsadnjakdnasjdsandkjsadnasjdnaskdsankjdsajndkasdkjsandsajkdnasjkd"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
