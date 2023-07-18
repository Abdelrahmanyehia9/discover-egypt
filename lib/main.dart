import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart" ;
import "package:get/get.dart";
import "package:myegypt/features/auth/presentation/login/view/login_view.dart";
import "package:myegypt/features/welcome/splash/view/splash_screen.dart";
import "core/helper/binding.dart";
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
    return   GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
