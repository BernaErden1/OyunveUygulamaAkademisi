import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/Widgets/mini_header.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';


class ProfilAyarlarSayfasi extends StatefulWidget {
 @override
 _ProfilAyarlarSayfasi createState() => _ProfilAyarlarSayfasi();
}

class _ProfilAyarlarSayfasi extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body:  Column(
            children: [
              BaslikBarMini(yazi: TurkceItemler().profilDuzenle),
            SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
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
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                    height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape : BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: ColorsUtility().backgroundColor,
                        ),
                        color: ColorsUtility().thirdColor,
                      ),
                      child: Icon(Icons.edit, color: ColorsUtility().backgroundColor,)
                  ))
                ],
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top:10,bottom:15,right: 20,left: 20),
                decoration: BoxDecoration(
                  color: ColorsUtility().backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius:5,
                      offset: Offset(1,1),
                      color: ColorsUtility().yazi.withOpacity(0.2)
                    )
                  ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: ColorsUtility().backgroundColor
                      )
                    ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: TurkceItemler().kullaniciAdi,
                      labelStyle: TextStyle (fontSize: 20, color:ColorsUtility().thirdColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "   Kullanıcı İsmi",
                      hintStyle: TextStyle (fontSize: 16, fontWeight: FontWeight.bold, color:ColorsUtility().yazi)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10,bottom: 15,right: 20,left: 20),
                decoration: BoxDecoration(
                    color: ColorsUtility().backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius:5,
                          offset: Offset(1,1),
                          color: ColorsUtility().yazi.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: TurkceItemler().kullaniciEmail,
                      labelStyle: TextStyle (fontSize: 20, color:ColorsUtility().thirdColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "   tarifim@gmail.com",
                      hintStyle: TextStyle (fontSize: 16, fontWeight: FontWeight.bold, color:ColorsUtility().yazi)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10,bottom: 15,right: 20,left: 20),
                decoration: BoxDecoration(
                    color: ColorsUtility().backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius:5,
                          offset: Offset(1,1),
                          color: ColorsUtility().yazi.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: TurkceItemler().hakkimda,
                      labelStyle: TextStyle (fontSize: 20, color:ColorsUtility().thirdColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "   Uygulamayı üç aydır kullanıyorum ve oldukça faydasını..",
                      hintStyle: TextStyle (fontSize: 16, fontWeight: FontWeight.bold, color:ColorsUtility().yazi)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10,bottom: 10,right: 20,left: 20),
                decoration: BoxDecoration(
                    color: ColorsUtility().backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius:5,
                          offset: Offset(1,1),
                          color: ColorsUtility().yazi.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: ColorsUtility().backgroundColor
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: TurkceItemler().webSitesi,
                      labelStyle: TextStyle (fontSize: 20, color:ColorsUtility().thirdColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "   oyunveuygulama.com",
                      hintStyle: TextStyle (fontSize: 16, fontWeight: FontWeight.bold, color:ColorsUtility().yazi)
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  OutlinedButton(
                    child: Text("KAYDET",style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: ColorsUtility().thirdColor)),
                                onPressed: (){} ,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
    )
                ],
              )
            ],
          ),

      );
  }
}

