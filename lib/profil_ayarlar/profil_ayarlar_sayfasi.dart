import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tarifim/Widgets/mini_header.dart';
import 'package:tarifim/auth_controller.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';


class ProfilAyarlarSayfasi extends StatefulWidget {
  const ProfilAyarlarSayfasi({Key? key}) : super(key: key);

  @override
  _ProfilAyarlarSayfasi createState() => _ProfilAyarlarSayfasi();
}


class _ProfilAyarlarSayfasi extends State {

  void initState() {
    super.initState();
    getImageURL().then((value){
      indirmeLink = value;
      setState(() {
        
      });
    });
  }
  Future<String?> getImageURL()async{
    return await FirebaseStorage.instance.ref().child("profilresimleri").child(FirebaseAuth.instance.currentUser!.uid).child("profilresmi.png").getDownloadURL();
  }
  bool showPassword = false;
  String? indirmeLink;
   late File dosya;
   kamerdanYukle() async{
    var alinanDosya = await ImagePicker().pickImage(source: ImageSource.camera);
    if (alinanDosya == null){
      return;
    }
    setState((){

      dosya = File(alinanDosya.path);


    });
    final referansyol = FirebaseStorage.instance.ref().child("profilresimleri").child(FirebaseAuth.instance.currentUser!.uid).child("profilresmi.png");
    final yukleme = referansyol.putFile(dosya);
    String url = await (await yukleme).ref.getDownloadURL();
    setState(() {
      indirmeLink = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
      primary: ColorsUtility().thirdColor,
      onPrimary: ColorsUtility().thirdColor,
      padding: EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
    );
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            BaslikBarMini(yazi: TurkceItemler().profilDuzenle),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  InkWell(
                    onTap:(){
                      kamerdanYukle();
                    },
                    child:
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
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 5))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: indirmeLink != null ? NetworkImage(indirmeLink!) as ImageProvider : AssetImage("assets/kullanici.jpg"),
                              fit: BoxFit.cover))),
                  ),
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
                              color: ColorsUtility().backgroundColor,
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
            SizedBox(
              height: 20,
            ),
            buildTextField(
                TurkceItemler().kullaniciAdi, "Kullan??c?? ad?? ve soyad??", false),
            buildTextField(
                TurkceItemler().kullaniciEmail, "tarifim@gmail.com", false),
            buildTextField(
                TurkceItemler().hakkimda,
                "Uygulamay?? ???? ayd??r kullan??yorum ve olduk??a faydas??n??...",
                false),
            buildTextField(TurkceItemler().konum, "??stanbul", false),
            buildTextField("??ifre", "*********", true),
            SizedBox(
              height: 35,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(

                    child: Text("KAYDET",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: ColorsUtility().thirdColor)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(

                      padding: EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AuthController.instance.logOut();
                      },
                      child: Text("??IKI?? YAP",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: ColorsUtility().backgroundColor)),
                      style: elevatedButtonStyle
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String Text, bool isPasswordTextField) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      decoration: BoxDecoration(
          color: ColorsUtility().backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(1, 1),
                color: ColorsUtility().yazi.withOpacity(0.2))
          ]),
      child: TextField(
        style: TextStyle (
            color: ColorsUtility().yazi,
            fontFamily: "Montserrat"
        ),
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: ColorsUtility().yazi,
                ))
                : null,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: ColorsUtility().backgroundColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: ColorsUtility().backgroundColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle:
            TextStyle(fontSize: 20, color: ColorsUtility().thirdColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: Text,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsUtility().yazi)),
      ),
    );
  }
}