import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

import '../Widgets/header_main.dart';

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
                      _kullaniciAdTextField(),
                      spaceSize(),
                      _emailTextField(),
                      spaceSize(),
                      _passTextield(),
                      spaceSize(),
                      _kayitOlButton(),
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
          "Hoşgeldiniz",
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

  ElevatedButton _kayitOlButton() {
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
        onPressed: () {},
        child: Text(
          TurkceItemler().kayitOl,
          style: TextStyle(
              color: ColorsUtility().backgroundColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              fontSize: 28),
        ));
  }

  

  TextFormField _passTextield() {
    return TextFormField(
        obscureText: _isSecure,
        validator: MyFormFieldValidator().isNotEmpy,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        textInputAction: TextInputAction.done,
        cursorColor: ColorsUtility().thirdColor,
        style: TextStyle(
          color: ColorsUtility().thirdColor,
        ),
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
        fontWeight: FontWeight.w500,
        fontFamily: "Montserrat",
        fontSize: 18),
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
                color: ColorsUtility().thirdColor)));
  }

  TextFormField _emailTextField() {
    return TextFormField(
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
    );
  }
}


  TextFormField _kullaniciAdTextField() {
    return TextFormField(
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
          labelText: "Kullanıcı Adı",
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
    );
  }

