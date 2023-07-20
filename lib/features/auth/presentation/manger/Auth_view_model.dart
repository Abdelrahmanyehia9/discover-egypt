import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/home/data/local_shared_prefrences.dart';
import 'package:myegypt/features/home/presentation/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/signup_model.dart';

class AuthViewModel extends GetxController {
  String get errorMessage => _errorMessage;
  String _errorMessage = 'something went Wrong';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference signup = FirebaseFirestore.instance.collection(
      'users');
  completeInfoSignUp({required String email, required String passWord, required String userName}) {
    SignUpModel user = SignUpModel(
        userName: userName, email: email, passWord: passWord,  dateOfReges:
    DateTime.now().toString()
    ) ;
    signup.doc(_auth.currentUser!.email).set(user.toJson());

  }

  Future<void> loginUsingEmailAndPassword(
      {required String email, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      preferences.setBool(isLogin, true);
      Get.off(() => const HomeView());
    } catch (e) {
      if (e is FirebaseAuthException) {
        _errorMessage = e.message!;
      }
      Get.snackbar('login failed', _errorMessage,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }

  Future<void> signUpUsingEmailAndPassword(
      {required String email, required String password , required String username}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
         completeInfoSignUp(email: email , passWord: password  , userName:  username) ;
         setValue(true) ;
      Get.off(() => const HomeView());
    } catch (e) {
      if (e is FirebaseAuthException) {
        Get.snackbar('Signup failed', e.message!,
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      } else {
        Get.snackbar(
            'Signup failed', 'something went wrong please try again later',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      }
    }
  }

 updateInfoSignUp({required String country , required String date , required bool isMale}){
    
    signup.doc(_auth.currentUser!.email).update({'country':country , 'birthDate':date , 'isMale':isMale});
    
    
}

}
