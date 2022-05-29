import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';


class ProfilAyarlarSayfasi extends StatefulWidget {
  const ProfilAyarlarSayfasi({Key? key}) : super(key: key);
  @override
  _ProfilAyarlarSayfasi createState() => _ProfilAyarlarSayfasi();
}


class _ProfilAyarlarSayfasi extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUtility().primaryColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(

            Icons.navigate_before_outlined,
            color: ColorsUtility().thirdColor,

          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(

              Icons.settings,
              color: ColorsUtility().thirdColor,

            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(

        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus;

          },
          child: ListView(
            children: [
              Text(
                TurkceItemler().profilDuzenle,
                style: TextStyle(
                    color: ColorsUtility().thirdColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Alegreya",
                    fontSize: 25),
              ),

              const SizedBox(

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
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color:
                                      Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/kullanici.jpg"),
                                fit: BoxFit.cover))),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color:
                                    ColorsUtility().backgroundColor,
                              ),
                              color: ColorsUtility().thirdColor,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: ColorsUtility().backgroundColor,
                            )))
                  ],
                ),
              ),
              const SizedBox(

                height: 20,
              ),
              TextField(
                decoration: InputDecoration(

                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: TurkceItemler().kullaniciAdi,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                    hintText: "Kullanıcı İsmi",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtility().yazi)),
              ),
              const SizedBox(

                height: 20,
              ),
              TextField(
                decoration: InputDecoration(

                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: TurkceItemler().kullaniciEmail,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                    hintText: "tarifim@gmail.com",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtility().yazi)),
              ),
              const SizedBox(

                height: 20,
              ),
              TextField(
                decoration: InputDecoration(

                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: TurkceItemler().hakkimda,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                    hintText:
                        "Uygulamayı üç aydır kullanıyorum ve oldukça faydasını...",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtility().yazi)),
              ),
              const SizedBox(

                height: 20,
              ),
              TextField(
                decoration: InputDecoration(

                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: TurkceItemler().webSitesi,
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                    hintText: "oyunveuygulama.com",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtility().yazi)),
              ),
              const SizedBox(

                height: 35,
              ),
              Row(
                children: [
                  OutlinedButton(

                    child: Text("KAYDET",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: ColorsUtility().thirdColor)),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

