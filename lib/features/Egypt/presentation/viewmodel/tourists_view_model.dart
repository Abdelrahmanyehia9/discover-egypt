import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Egypt/data/model/tourists_model.dart';
import 'package:myegypt/features/auth/data/model/signup_model.dart';

class TouristsViewModel extends GetxController {
  final CollectionReference _tourists =
      FirebaseFirestore.instance.collection("tourists");

  List<TouristsModel> get tourists => _touristsList;
  final List<TouristsModel> _touristsList = [];

  TouristsViewModel() {
    getTourist();
  }

  getTourist() async {
    var result = await _tourists.get();
    for (int i = 0; i < result.docs.length; i++) {
      if (result.docs[i].get('image')!= "") {
        _touristsList.add(TouristsModel.fromJson(result.docs[i].data()));
      }
    }
    update();
  }

  addTourists(
      {required String imagePath,
       required String userName,
       required String country,
       required String birthDate,
       required bool isMale,
       required String mobile}) {
    TouristsModel model = TouristsModel(
      isMale: isMale,
      country: country,
      name: userName,
      image: imagePath,
      birthDate: birthDate,
      dateComing: DateTime.now().toString(),
      mobile: mobile,
    );
    _tourists.doc(FirebaseAuth.instance.currentUser!.email).set(model.toJson());
  }
}
