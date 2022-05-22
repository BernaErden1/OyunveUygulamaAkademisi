import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

class ProfilSayfasi extends StatelessWidget {
  const ProfilSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            "assets/onboarding1.png",
            fit: BoxFit.cover,
          ),
        ),
        DraggableScrollableSheet(
          minChildSize: 0.1,
          initialChildSize: 0.22,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                color: ColorsUtility().backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //profilim yazisi
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          Text(
                            TurkceItemler().profilim,
                            style: TextStyle(
                                color: ColorsUtility().thirdColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Alegreya",
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    //Kullanici ismi ve resmi bolumu
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/kullanici.jpg",
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TurkceItemler().kullaniciAdi,
                                style: TextStyle(
                                    color: ColorsUtility().thirdColor,
                                    fontFamily: "Alegreya",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                TurkceItemler().profilYazisi,
                                style: TextStyle(
                                    color: ColorsUtility().thirdColor,
                                    fontFamily: "Alegreya",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )),
                          Icon(
                            Icons.person_pin,
                            color: ColorsUtility().thirdColor,
                            size: 45,
                          )
                        ],
                      ),
                    ),
                    //takipci, takip edilen bolumm
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(32),
                      color: ColorsUtility().primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_pin_sharp,
                                    color: ColorsUtility().backgroundColor,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "105",
                                    style: TextStyle(
                                        color: ColorsUtility().backgroundColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Alegreya",
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                TurkceItemler().takipciSayisi,
                                style: TextStyle(
                                    color: ColorsUtility().backgroundColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Alegreya",
                                    fontSize: 14),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.contacts_sharp,
                                    color: ColorsUtility().backgroundColor,
                                    size: 33,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "86",
                                    style: TextStyle(
                                        color: ColorsUtility().backgroundColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Alegreya",
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                TurkceItemler().takipEdilen,
                                style: TextStyle(
                                    color: ColorsUtility().backgroundColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Alegreya",
                                    fontSize: 14),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.collections_bookmark_outlined,
                                    color: ColorsUtility().backgroundColor,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(
                                        color: ColorsUtility().backgroundColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Alegreya",
                                        fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                TurkceItemler().tarifDefterim,
                                style: TextStyle(
                                    color: ColorsUtility().backgroundColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Alegreya",
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // takipcilerim
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: [
                          Text(
                            TurkceItemler().takipcilerim,
                            style: TextStyle(
                                color: ColorsUtility().thirdColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Alegreya",
                                fontSize: 18),
                          ),
                          //takipcilerin listesi
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 64,
                            height: 80,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  margin: EdgeInsets.only(right: 8),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/${index + 1}.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    //tariflerim baslıgı
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: [
                          Text(
                            TurkceItemler().tarifDefterim,
                            style: TextStyle(
                                color: ColorsUtility().thirdColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Alegreya",
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    //tariflerim bolumu
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment(0.0, -1.0),
                        color: ColorsUtility().backgroundColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/steak.jpeg",
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Muhteşem Steak',
                              style: TextStyle(
                                  color: ColorsUtility().thirdColor,
                                  fontFamily: "Alegreya",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Detaylı anlatımı ile lezzet garantili steak tarifi.',
                              style: TextStyle(
                                  color: ColorsUtility().yazi,
                                  fontFamily: "Alegreya",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.bookmarks,
                              color: ColorsUtility().thirdColor,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                    //Degerlendirmelerim bolumu
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: [
                          Text(
                            TurkceItemler().degerlendirmelerim,
                            style: TextStyle(
                                color: ColorsUtility().thirdColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Alegreya",
                                fontSize: 18),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 64,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Takipçi $index",
                                          style: TextStyle(
                                              color: ColorsUtility().thirdColor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Alegreya",
                                              fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color:
                                                  ColorsUtility().degerlendirme,
                                            ),
                                            Icon(
                                              Icons.star_rounded,
                                              color:
                                                  ColorsUtility().degerlendirme,
                                            ),
                                            Icon(
                                              Icons.star_rounded,
                                              color:
                                                  ColorsUtility().degerlendirme,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Harika bir tarif! Hızlı ve kolay bir şekilde hazırladım.",
                                      style: TextStyle(
                                          color: ColorsUtility().yazi,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Alegreya",
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                );
                              },
                              itemCount: 3,
                              shrinkWrap: true,
                              controller:
                                  ScrollController(keepScrollOffset: false),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    ));
  }
}
