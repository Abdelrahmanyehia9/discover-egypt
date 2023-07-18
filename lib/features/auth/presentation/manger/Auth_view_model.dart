import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/home/presentation/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthViewModel extends GetxController{
  String get errorMessage=> _errorMessage ;
  String _errorMessage = 'something went Wrong' ;
  final FirebaseAuth _auth = FirebaseAuth.instance ;
Future<void>loginUsingEmailAndPassword ({required String email , required String password})async{
  SharedPreferences preferences = await SharedPreferences.getInstance() ;
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password) ;
    preferences.setBool(isLogin, true) ; 
    Get.off(()=>const HomeView()) ;
  }catch (e)
  {
    if(e is FirebaseAuthException){

      _errorMessage = e.message! ;
    }
    Get.snackbar('login failed', _errorMessage , snackPosition: SnackPosition.BOTTOM , backgroundColor: Colors.white);

  }

}
Future<void>signUpUsingEmailAndPassword({required String email , required String password})async{

try {

  await _auth.createUserWithEmailAndPassword(email: email, password: password)  ;
  Get.off(()=>const HomeView()) ;


}catch (e){
if(e is FirebaseAuthException) {
  Get.snackbar('Signup failed',e.message! ,
      snackPosition: SnackPosition.BOTTOM , backgroundColor: Colors.white);
}else{
  Get.snackbar('Signup failed', 'something went wrong please try again later' ,
      snackPosition: SnackPosition.BOTTOM , backgroundColor: Colors.white);
}

}

}








}