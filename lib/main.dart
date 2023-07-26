import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart" ;
import "package:get/get.dart";
import "package:myegypt/constant.dart";
import "package:myegypt/features/Egypt/data/model/tourists_model.dart";
import "package:myegypt/features/Egypt/presentation/viewmodel/tourists_view_model.dart";
import "package:myegypt/features/auth/presentation/manger/Auth_view_model.dart";
import "package:myegypt/features/auth/presentation/view/chose_profile_image.dart";
import "package:myegypt/features/auth/presentation/view/coplete_info_view.dart";
import "package:myegypt/features/auth/presentation/view/sign_up_view.dart";
import "package:myegypt/features/home/presentation/view/home_view.dart";
import "package:myegypt/features/welcome/splash/view/splash_screen.dart";

import "firebase_options.dart";





void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

runApp(const MyEgypt()) ;

}


class MyEgypt extends StatelessWidget {
  const MyEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const GetMaterialApp(

      debugShowCheckedModeBanner: false,
      home:  SplashView(),
    );
  }
}
