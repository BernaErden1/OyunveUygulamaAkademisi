import 'package:flutter/material.dart';
import '../Widgets/header_main.dart';
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
            BaslikBar(),
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
                        color: ColorsUtility().primaryColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/mail.png'),
                      hintText: 'E-posta',
                      hintStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontSize: 18),
                      enabledBorder: _buildBorder(ColorsUtility().primaryColor),
                      disabledBorder:_buildBorder(ColorsUtility().primaryColor),
                      focusedBorder: _buildBorder(ColorsUtility().primaryColor),
                      errorBorder: _buildBorder(ColorsUtility().primaryColor),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
