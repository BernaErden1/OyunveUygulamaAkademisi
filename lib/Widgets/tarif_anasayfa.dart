import 'package:flutter/material.dart';
import 'package:tarifim/firebase/models/malzeme.dart';

import '../product/utility.dart';

class TarifCard extends StatelessWidget {
  final bool isSave;
  final String baslik;
  final String desc;
  final String image;
  final List<Malzeme> malzemeler;
  const TarifCard({
    Key? key,
    required this.isSave,
    required this.baslik,
    required this.desc,
    required this.image,
    required this.malzemeler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 200,
      width: MediaQuery.of(context).size.width - 15,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.40),
                BlendMode.multiply,
              ),
              image: AssetImage("assets/$image"),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 10),
              blurRadius: 10,
              color: ColorsUtility().yazi.withOpacity(0.2),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          spaceSize(size: 20),
          Text(
            baslik,
            style: TextStyle(
                color: ColorsUtility().backgroundColor,
                fontFamily: "Alegreya",
                fontSize: 25,
                fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  !isSave
                      ? Icons.bookmark_add_outlined
                      : Icons.bookmark_added,
                  size: 30,
                  color: ColorsUtility().backgroundColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
