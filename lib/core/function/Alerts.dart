import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/auth/data/model/images_model.dart';
import 'package:myegypt/features/auth/presentation/manger/info_user_controller.dart';

class Alerts{

  static void alertDeletePhoto({required ImagesModel model}){


    Get.defaultDialog(
      title: "alert" ,
      titleStyle: const TextStyle(color: mainColor , fontWeight: FontWeight.bold),
      titlePadding: const EdgeInsets.only(top: 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 18),
      content: const Center(child: Text(
          "are you really want to delete this photo " ,
      textAlign: TextAlign.center,)) ,
       textCancel:  "No" ,
        textConfirm: "Yes" ,
      confirmTextColor: Colors.white ,
onConfirm: ()async{
  await UserInfoController().deleteUserImage(model: model) ;
  Get.back() ;
}
    ) ;




  }








}