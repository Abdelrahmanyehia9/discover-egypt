import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/dim.dart';
import 'package:myegypt/features/welcome/splash/view/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashViewModel>(
      init: SplashViewModel(),
      builder:(controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: SizedBox(height: dimHeight(context)*0.4,
            child: Image.asset("assets/images/logosplash.png")),),
      ),
    );
  }
}
