import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myegypt/features/auth/presentation/view/coplete_info_view.dart';

import '../../../../core/helper/sign_up_data.dart';

class PickImage extends GetxController {
  File? image;

  final picker = ImagePicker();

  void upload({required ImageSource imgSource}) async {
    var pickedImage = await picker.pickImage(source: imgSource);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    update();
  }

  void removeImage() {
    image = null;
    update();
  }

  Future<void> toFireStorage() async {
    if (image != null) {
      Reference storage = FirebaseStorage.instance.ref(
          'images/${FirebaseAuth.instance.currentUser!.email}/profile.jpg');
      await storage.putFile(image!);
      SignUpUserInfo.instance.imagePath = await storage.getDownloadURL();
      update();
    } else {
      return;
    }
  }
}
