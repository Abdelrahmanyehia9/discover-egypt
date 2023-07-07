import "package:flutter/material.dart" ;
import "package:get/get.dart";
import "features/home/presentation/view/home_view.dart";





void main(){

  runApp(const MyEgypt()) ;

}


class MyEgypt extends StatelessWidget {
  const MyEgypt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeView(),
    );
  }
}
