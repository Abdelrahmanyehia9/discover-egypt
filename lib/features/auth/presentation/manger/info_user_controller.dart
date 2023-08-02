import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/model/images_model.dart';
import '../../data/model/signup_model.dart';

class UserInfoController extends GetxController {

  SignUpModel? userModel;
  List<ImagesModel> imageList = [];

  UserInfoController() {
    getUserInfo();
    getUserImages();
  }


  Future<void> getUserInfo() async {
    final DocumentReference model = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email);
    var results = await model.get();
    userModel = SignUpModel.fromJson(results.data());
    update();
  }


  Future<void> getUserImages() async {
    imageList = [];

    CollectionReference ref = FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('photos');
    var data = await ref.get();
    for (int i = 0; i < data.docs.length; i ++) {
      imageList.add(ImagesModel.fromJson(data.docs[i].data()));
      imageList.sort((a, b) {
        return DateTime.parse(a.dateTime.toDate().toString()).compareTo(
            DateTime.parse(b.dateTime.toDate().toString()));
      });
    }
    List<ImagesModel> image = List.from(imageList.reversed);
    imageList = image;
    update();
  }

}