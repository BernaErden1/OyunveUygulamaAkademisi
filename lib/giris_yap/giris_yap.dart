import 'package:flutter/material.dart';
import 'package:tarifim/product/dil/turkce_itemler.dart';
import 'package:tarifim/product/utility.dart';

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

  final GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TurkceItemler().uygIsmi),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      _emailTextField(),
                      spaceSize(),
                      _passTextield(),
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
                      _signInGoogle(),
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
        onPressed: () {},
        child: Text(
          "Hala kayıt olmadın mı ? Kayıt ol",
          style: TextStyle(
              fontSize: 16, color: ColorsUtility().secondaryColor),
        ));
  }

  Padding _welcome() {
    return Padding(
        padding: PaddingDimen().horizaontalPadding,
        child: Text(
          "Hoşgeldiniz",
          style: TextStyle(
              fontSize: 40, color: ColorsUtility().secondaryColor),
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
              fontSize: 22, color: ColorsUtility().primaryColor),
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
        onPressed: () {},
        child: Text(
          TurkceItemler().girisYap,
          style: const TextStyle(fontSize: 30),
        ));
  }

  Row _sifreUnutButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              TurkceItemler().sifremiUnuttum,
              style: TextStyle(color: ColorsUtility().primaryColor),
            ))
      ],
    );
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
