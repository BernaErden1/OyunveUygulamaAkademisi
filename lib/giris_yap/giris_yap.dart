import 'package:flutter/material.dart';
import 'package:tarifim/Widgets/header_main.dart';
import 'package:tarifim/auth_controller.dart';
import 'package:tarifim/kayit_ol/kayit_ol.dart';
import 'package:tarifim/main_page.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

import 'package:tarifim/sifremi_unuttum/sifremi_unuttum.dart';

class GirisYap extends StatefulWidget {
  const GirisYap({Key? key}) : super(key: key);

  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  bool _isSecure = true;

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            BaslikBar(),
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
                        fontSize: 20),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorsUtility().thirdColor),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsUtility().primaryColor,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorsUtility().thirdColor),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                        labelText: "Email",
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
                  TextFormField(
                    controller: passwordController,
                      obscureText: _isSecure,
                      validator: MyFormFieldValidator().isNotEmpy,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const [AutofillHints.password],
                      textInputAction: TextInputAction.done,
                      cursorColor: ColorsUtility().thirdColor,
                      style: TextStyle(
                          color: ColorsUtility().thirdColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 20),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: ColorsUtility().thirdColor),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorsUtility().primaryColor,
                              ),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: ColorsUtility().thirdColor),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                          labelText: "Şifre",
                          labelStyle: TextStyle(
                            color: ColorsUtility().thirdColor,
                          ),
                          hintStyle: TextStyle(
                            color: ColorsUtility().thirdColor,
                          ),
                          prefixIcon: _isSecure
                              ? Icon(
                            Icons.lock_outlined,
                            color: ColorsUtility().thirdColor,
                          )
                              : Icon(
                            Icons.lock_open_outlined,
                            color: ColorsUtility().thirdColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _changeSecure();
                              },
                              icon: AnimatedCrossFade(
                                firstChild: const Icon(Icons.visibility_outlined),
                                secondChild:
                                const Icon(Icons.visibility_off_outlined),
                                crossFadeState: _isSecure
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(seconds: 1),
                              ),
                              color: ColorsUtility().thirdColor))),
                      _sifreUnutButton(),
                      spaceSize(),
                      _girisYapButton(),
                      spaceSize(),
                      Divider(
                        thickness: 2,
                        height: 50,
                        color: ColorsUtility().secondaryColor,
                      ),
                      spaceSize(),
                      spaceSize(),
                      _logIn()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  TextButton _logIn() {
    return TextButton(
        onPressed: () {
          _navigateToKayitOl(context);
        },
        child: Text(
          "Hala kayıt olmadın mı ? Kayıt ol",
          style: TextStyle(
              color: ColorsUtility().secondaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              fontSize: 15),
        ));
  }

  Padding _welcome() {
    return Padding(
        padding: PaddingDimen().horizaontalPadding,
        child: Text(
          "Hoşgeldiniz",
          style: TextStyle(
              color: ColorsUtility().secondaryColor,
              fontWeight: FontWeight.w300,
              fontFamily: "Montserraat",
              fontSize: 50),
        ));
  }


  ElevatedButton _girisYapButton() {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize:
            MaterialStateProperty.all<Size>(const Size(200, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(
                ColorsUtility().primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: ColorsUtility().thirdColor)))),
        onPressed: () {
          AuthController.instance.login(emailController.text.trim(), passwordController.text.trim()).then((kullanici){
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context)=> MainPage(),),
            );
          });
        },
        child: Text(
          TurkceItemler().girisYap,
          style: TextStyle(
              color: ColorsUtility().backgroundColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              fontSize: 28),
        ));
  }

  Row _sifreUnutButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              _navigateToForgotPassword(context);
            },
            child: Text(
              TurkceItemler().sifremiUnuttum,
              style: TextStyle(
                  color: ColorsUtility().primaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Montserrat",
                  fontSize: 15),
            ))
      ],
    );
  }



  void _navigateToKayitOl(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => KayitOl()));
  }

void _navigateToForgotPassword(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword()));
}
}