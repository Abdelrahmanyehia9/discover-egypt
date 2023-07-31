import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/model/signup_model.dart';

class UserInfoController extends GetxController {
  SignUpModel? userModel;

  UserInfoController() {
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    final DocumentReference model = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email);
    var results = await model.get();
    userModel = SignUpModel.fromJson(results.data());
    update();
  }
}
