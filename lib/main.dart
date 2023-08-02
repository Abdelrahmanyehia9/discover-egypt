import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/home/data/local_shared_prefrences.dart';
import 'package:myegypt/firebase_options.dart';
import 'core/utils/material_color.dart';
import 'features/welcome/splash/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyEgypt());
}

class MyEgypt extends StatelessWidget {
  const MyEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: PrimaryColor.primary),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
