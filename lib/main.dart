import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart" ;
import "package:get/get.dart";
import "package:myegypt/constant.dart";
import "core/helper/binding.dart";
import "features/home/presentation/view/home_view.dart";
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
      home: const HomeView(),

    );
  }
}
