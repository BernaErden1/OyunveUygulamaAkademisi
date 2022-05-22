import 'package:flutter/material.dart';

import '../Widgets/baslik_bar.dart';
import '../product/utility.dart';

OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ));
  }
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  final String content =
      "Parola sıfırlama linkini göndereceğimiz e-posta adresini yazınız.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
      child: Container(
        alignment: Alignment.center,
        height: 150,
        width: double.infinity,
        color: ColorsUtility().primaryColor,
        child: Text(
          'Mutfakta Neler Var?',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    ),
            const SizedBox(
              height: 150,
            ),
                  Image.asset('assets/locked.png'),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: 17,
                        color: ColorsUtility().primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/mail.png'),
                      hintText: 'E-posta',
                      enabledBorder: _buildBorder(ColorsUtility().primaryColor),
                      disabledBorder:_buildBorder(ColorsUtility().primaryColor),
                      focusedBorder: _buildBorder(ColorsUtility().primaryColor),
                      errorBorder: _buildBorder(ColorsUtility().primaryColor),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
      child: CircleAvatar(
        radius: 25,
        backgroundColor: ColorsUtility().primaryColor,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 40,
        ),
      ),
      onTap: () {},
    ),
                    ),
  
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
