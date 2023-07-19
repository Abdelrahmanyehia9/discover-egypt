import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/home/presentation/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constant.dart';
import '../../../auth/presentation/view/login_view.dart';
import '../../../home/data/local_shared_prefrences.dart';

class SplashViewModel extends GetxController{

  @override
  void onInit() async{

      final bool logIn = await getValue() ;
      print(logIn);
      Future.delayed(const Duration(seconds: 3), ()  {
        if (
        logIn ) {

          Get.off(()=>const HomeView()) ;
        } else {
          Get.off( ()=>const LoginView())  ;
        }
      });

    super.onInit();
  }












}