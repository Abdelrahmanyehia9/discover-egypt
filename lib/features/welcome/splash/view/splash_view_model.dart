import 'dart:async';

import 'package:get/get.dart';
import 'package:myegypt/features/home/presentation/view/toggle_pages.dart';
import '../../../auth/presentation/view/login_view.dart';
import '../../../home/data/local_shared_prefrences.dart';

class SplashViewModel extends GetxController{

  @override
  void onInit() async{

      final bool logIn = await getValue() ;
      Timer(const Duration(seconds: 3), ()  {
        if (logIn) {
          Get.off(()=> const TogglePages()) ;
        } else {
          Get.off( ()=> LoginView())  ;
        }
      });

    super.onInit();
  }












}