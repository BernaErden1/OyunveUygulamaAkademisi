import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarifim/anasayfa/anasayfa.dart';
import 'package:tarifim/giris_yap/giris_yap.dart';
import 'package:tarifim/product/utility.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);

  }

  _initialScreen(User? user){
    if(user==null){
      print("Giriş Sayfası");
      Get.offAll(()=>GirisYap());
    }else{
      Get.offAll(()=>Anasayfa());
    }
  }


  Future<void> register(String name, email, password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      }catch(e){
      Get.snackbar("Kullanıcı Hakkında", "Kullanıcı mesajı",
      backgroundColor: ColorsUtility().primaryColor,
      snackPosition:  SnackPosition.BOTTOM,
      titleText: Text("Hesap oluşturma başarısız",
      style: TextStyle(
        color: ColorsUtility().backgroundColor
      )
      ),
         messageText: Text(
    e.toString()
    )
    );
    }
  }
  Future<void> login(String email, password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("Giriş Hakkında", "Giriş mesajı",
          backgroundColor: ColorsUtility().primaryColor,
          snackPosition:  SnackPosition.BOTTOM,
          titleText: Text("Giriş denemesi başarısız",
              style: TextStyle(
                  color: ColorsUtility().backgroundColor
              )
          ),
          messageText: Text(
              e.toString()
          )
      );
    }
  }
  Future<void> logOut()async {
    await auth.signOut();
  }
}