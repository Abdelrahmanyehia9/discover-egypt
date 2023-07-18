import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/home/presentation/view/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constant.dart';
import '../../../auth/presentation/login/view/login_view.dart';

class SplashViewModel extends GetxController{

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences pre = await SharedPreferences.getInstance();
      final bool? logIn = pre.getBool(isLogin);
      print(logIn);
      Future.delayed(const Duration(seconds: 3), ()  {
        if (
        logIn ?? false) {

          Get.off(()=>const HomeView()) ;
        } else {
          Get.off( ()=>const LoginView())  ;
        }
      });
    });
    super.onInit();
  }












}