import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/product/tarif_kartlari_data.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';


class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasi createState() => _ProfilSayfasi();
}

class _ProfilSayfasi extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsUtility().backgroundColor,
        body: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              //Profilim yazısı
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TurkceItemler().profilim,
                    style: TextStyle(
                        color: ColorsUtility().thirdColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Alegreya",
                        fontSize: 30),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              //Kullanıcı resmi ve Kullanıcı adı bölümü
              Row(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: ColorsUtility().backgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2, blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0,5)
                            )
                          ],
                          shape : BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/kullanici.jpg"),
                              fit: BoxFit.cover
                          ))
                  ),
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
                 Stack(
                     children: [
                       Container(
                         child: Icon(
                         Icons.person_pin,
                         color: ColorsUtility().thirdColor,
                         size: 45,
                     ),
                       ),
                       Positioned(
                           bottom: 0,
                           right: 5,
                           child: Container(
                               height: 20,
                               width: 20,
                               decoration: BoxDecoration(
                                 shape : BoxShape.circle,
                                 color: ColorsUtility().backgroundColor,
                               ),
                               child: Icon(Icons.settings_sharp, color: ColorsUtility().thirdColor,)
                           ))
                 ]
                 )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //Takip edilen, Takipçi, Tariflerim kutusu
              Container(
                padding: EdgeInsets.only(top: 45, left: 35, right: 35),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    color: ColorsUtility().primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 10,
                        color: ColorsUtility().yazi.withOpacity(0.2),
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      width: 35,
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
                    SizedBox(
                      width: 35,
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
              SizedBox(
                height: 20,
              ),
              //Takipçilerim başlığı
              Row(children: [
                Text(
                  TurkceItemler().takipcilerim,
                  style: TextStyle(
                      color: ColorsUtility().thirdColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Alegreya",
                      fontSize: 18),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              //Takipçilerim görüntüleme
              Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(right: 8),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/${index + 1}.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ]);
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //Tariflerim başlığı
              Row(
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
              SizedBox(
                height: 5,
              ),
              //Tariflerim liste görünümü
              Expanded(
                  child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          itemCount: tarifKartlariListesi.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 25, bottom: 15),
                                  width:
                                      (MediaQuery.of(context).size.width - 30),
                                  height: 200,
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.30),
                                          BlendMode.multiply,
                                        ),
                                        image: AssetImage(
                                            tarifKartlariListesi[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(5, 10),
                                          blurRadius: 10,
                                          color: ColorsUtility()
                                              .yazi
                                              .withOpacity(0.2),
                                        )
                                      ]),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          tarifKartlariListesi[index].title,
                                          style: TextStyle(
                                              color: ColorsUtility()
                                                  .backgroundColor,
                                              fontFamily: "Alegreya",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 35),
                                        Text(
                                          tarifKartlariListesi[index].subtitle,
                                          style: TextStyle(
                                              color: ColorsUtility()
                                                  .backgroundColor,
                                              fontFamily: "Alegreya",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 35),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color: Colors.white.withOpacity(0.4),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              spreadRadius: 2, blurRadius: 10,
                                                              color: Colors.black.withOpacity(0.1),
                                                              offset: Offset(0,10)
                                                          )
                                                        ],
                                                        shape : BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/kullanici.jpg"),
                                                            fit: BoxFit.cover
                                                        ))
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: Offset(5, 10),
                                                          blurRadius: 10,
                                                          color: ColorsUtility()
                                                              .yazi
                                                              .withOpacity(0.2),
                                                        )
                                                      ]),
                                                  child: Text(
                                                    TurkceItemler()
                                                        .kullaniciAdi,
                                                    style: TextStyle(
                                                        color: ColorsUtility()
                                                            .backgroundColor,
                                                        fontFamily: "Alegreya",
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(children: [
                                                Icon(
                                                  Icons.schedule,
                                                  color: ColorsUtility()
                                                      .thirdColor,
                                                  size: 18,
                                                ),
                                                SizedBox(width: 7),
                                                Text(
                                                  tarifKartlariListesi[index]
                                                      .time,
                                                  style: TextStyle(
                                                      color: ColorsUtility()
                                                          .backgroundColor,
                                                      fontFamily: "Alegreya",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ],
                            );
                          },
                        ),
                      )))
            ],
          ),
        ));
  }
}


