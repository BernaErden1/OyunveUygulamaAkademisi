import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';

import '../Widgets/header_main.dart';
import '../firebase/auth_controller.dart';
import '../product/utility.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({Key? key}) : super(key: key);

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  bool _isSecure = true;

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BaslikBar(),
            spaceSize(size: 60),
            _welcome(),
            spaceSize(),
            Form(
                key: _globalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: PaddingDimen().horizaontalPadding,
                  child: Column(
                    children: [
                      spaceSize(size: 60),
                      //Kullanıcı Adı Text
                      TextFormField(
                        controller: nameController,
                        validator: MyFormFieldValidator().isNotEmpy,
                        keyboardType: TextInputType.name,
                        autofillHints: const [AutofillHints.username],
                        textInputAction: TextInputAction.next,
                        cursorColor: ColorsUtility().thirdColor,
                        style: TextStyle(
                            color: ColorsUtility().thirdColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            fontSize: 18),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorsUtility().thirdColor),
                                borderRadius: MyRadius().borderRad ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsUtility().primaryColor,
                                ),
                                borderRadius: MyRadius().borderRad),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorsUtility().thirdColor),
                                borderRadius: MyRadius().borderRad),
                            labelText: TurkceItemler().kullaniciAdi,
                            labelStyle: TextStyle(
                              color: ColorsUtility().thirdColor,
                            ),
                            hintStyle: TextStyle(
                              color: ColorsUtility().thirdColor,
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: ColorsUtility().thirdColor,
                            )),
                      ),
                      spaceSize(),
                      //Email Text Field
                      TextFormField(
                        controller: emailController,
                        validator: MyFormFieldValidator().isNotEmpy,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        textInputAction: TextInputAction.next,
                        cursorColor: ColorsUtility().thirdColor,
                        style: TextStyle(
                            color: ColorsUtility().thirdColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            fontSize: 18),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorsUtility().thirdColor),
                                borderRadius: MyRadius().borderRad),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsUtility().primaryColor,
                                ),
                                borderRadius: MyRadius().borderRad),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        ColorsUtility().thirdColor),
                                borderRadius: MyRadius().borderRad),
                            labelText: TurkceItemler().kullaniciEmail,
                            labelStyle: TextStyle(
                              color: ColorsUtility().thirdColor,
                            ),
                            hintStyle: TextStyle(
                              color: ColorsUtility().thirdColor,
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: ColorsUtility().thirdColor,
                            )),
                      ),
                      spaceSize(),
                      //Password Text Field
                      TextFormField(
                          controller: passwordController,
                          obscureText: _isSecure,
                          validator: MyFormFieldValidator().isNotEmpy,
                          keyboardType: TextInputType.visiblePassword,
                          autofillHints: const [
                            AutofillHints.password
                          ],
                          textInputAction: TextInputAction.done,
                          cursorColor: ColorsUtility().thirdColor,
                          style: TextStyle(
                            color: ColorsUtility().thirdColor,
                          ),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          ColorsUtility().thirdColor),
                                  borderRadius: MyRadius().borderRad),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        ColorsUtility().primaryColor,
                                  ),
                                  borderRadius: MyRadius().borderRad),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          ColorsUtility().thirdColor),
                                  borderRadius: MyRadius().borderRad),
                              labelText: TurkceItemler().sifre,
                              labelStyle: TextStyle(
                                  color: ColorsUtility().thirdColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 18),
                              hintStyle: TextStyle(
                                color: ColorsUtility().thirdColor,
                              ),
                              prefixIcon: _isSecure
                                  ? Icon(
                                      Icons.lock_outlined,
                                      color:
                                          ColorsUtility().thirdColor,
                                    )
                                  : Icon(
                                      Icons.lock_open_outlined,
                                      color:
                                          ColorsUtility().thirdColor,
                                    ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _changeSecure();
                                  },
                                  icon: AnimatedCrossFade(
                                    firstChild: const Icon(
                                        Icons.visibility_outlined),
                                    secondChild: const Icon(Icons
                                        .visibility_off_outlined),
                                    crossFadeState: _isSecure
                                        ? CrossFadeState.showFirst
                                        : CrossFadeState.showSecond,
                                    duration:
                                        const Duration(seconds: 1),
                                  ),
                                  color:
                                      ColorsUtility().thirdColor))),
                      spaceSize(),
                      //Kayıt ol butonu
                      ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      ColorsUtility().primaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          MyRadius().borderRad,
                                      side: BorderSide(
                                          color: ColorsUtility().thirdColor)))),
                          onPressed: () async{
                            AuthController.instance.register(
                                nameController.text.trim(),
                                emailController.text.trim(),
                                passwordController.text.trim()).then((kullanici){
                                  FirebaseFirestore.instance.collection("Kullanicilar").doc(emailController.text).set({
                                    "KullaniciAdi":nameController.text,
                                    "KullaniciEposta":emailController.text, "KullaniciSifre":passwordController.text,
                                  });
                                } );
                          },
                          child: Text(
                            TurkceItemler().kayitOl,
                            style: TextStyle(
                                color:
                                    ColorsUtility().backgroundColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                                fontSize: 28),
                          )),
                      spaceSize(),
                      Divider(
                        thickness: 2,
                        height: 50,
                        color: ColorsUtility().secondaryColor,
                      ),
                      spaceSize(),
                      _signInGoogle(),
                      spaceSize(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Padding _welcome() {
    return Padding(
        padding: PaddingDimen().horizaontalPadding,
        child: Text(
          TurkceItemler().welcome,
          style: TextStyle(
              color: ColorsUtility().secondaryColor,
              fontWeight: FontWeight.w300,
              fontFamily: "Montserraat",
              fontSize: 50),
        ));
  }

  TextButton _signInGoogle() {
    return TextButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.g_mobiledata_outlined,
          size: 40,
          color: ColorsUtility().primaryColor,
        ),
        label: Text(
          TurkceItemler().loginGoogle,
          style: TextStyle(
              color: ColorsUtility().primaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: "PlusJakarta",
              fontSize: 22),
        ));
  }
}
