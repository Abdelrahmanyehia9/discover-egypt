import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/auth/presentation/manger/info_user_controller.dart';
import 'package:myegypt/features/home/presentation/view/profile_view.dart';
import 'package:path/path.dart';

import '../../../../core/helper/sign_up_data.dart';
import '../../../home/presentation/widget/profile_view.dart';

class PickImage extends GetxController {
  File? image;
  String? nameOfImage ;
  String? imagePath ;
  bool isLoading = false ;
  final picker = ImagePicker();
/// upload image from device
  Future<void> uploadFromMyDevice({required ImageSource imgSource , }) async {
    var pickedImage = await picker.pickImage(source: imgSource);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      nameOfImage = basename(image!.path) ;
    }

    update();
  }
/// remove image before submit
  void removeProfileImage() {
    image = null;
    update();
  }
/// add image as profile pic
  Future<void> profileToFireStorage() async {

    if (image != null) {
      Reference storage =  FirebaseStorage.instance.ref('images/${FirebaseAuth.instance.currentUser!.email}/profile.jpg') ;

      await storage.putFile(image!);
      AppInfoHelper.instance.imagePath = await storage.getDownloadURL();


      update();
    } else {
      return;
    }
  }
  /// upload images in my profile
Future<void> uploadImages()async{
  CollectionReference ref = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.email).collection('photos') ;
  Reference storageRef = FirebaseStorage.instance.ref('images/${FirebaseAuth.instance.currentUser!.email}/$nameOfImage}');
    await storageRef.putFile(image!);
    imagePath = await storageRef.getDownloadURL() ;
      ref.add({ 'imagePath': imagePath  , 'TimeOfUpload' :DateTime.now()  });
update() ;

}

}
