import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/standard_packages.dart';
import 'package:myegypt/features/Guide/data/model/tour_package.dart';
import 'package:myegypt/features/Guide/presentation/widgets/tour_guied_package.dart';

import '../../data/model/tour_guide_model.dart';

class TourGuideViewModel extends GetxController {
  final List<TourGuideModel> _listOfTour = [];

  List<TourGuideModel> get listOfTour => _listOfTour;
  final CollectionReference _tourGuide =
      FirebaseFirestore.instance.collection("touGuides");

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  final List<TourGuidePackageModel> _selectedPack = [];

  List<TourGuidePackageModel> get selectedPAck => _selectedPack;
  int numOfShopCard = 0;

  TourGuideViewModel() {
    getTourGuide();
  }

  Future<void> getTourGuide() async {
    _loading.value = true;
    var data = await _tourGuide.get();

    for (int i = 0; i < data.docs.length; i++) {
      var pack = await _tourGuide
          .doc(data.docs[i].get("name"))
          .collection("packages")
          .get();

      _listOfTour.add(TourGuideModel.fromJson(data.docs[i].data()));
      _listOfTour[i].isLiked = await isFavourite(model: _listOfTour[i]);

      for (int j = 0; j < pack.docs.length; j++) {
        _listOfTour[i]
            .packages
            .add(TourGuidePackageModel.fromJson(pack.docs[j].data()));
      }
    }

    _loading.value = false;
    update();
  }

  Future<void> addToMyFavourite({required TourGuideModel model}) async {
    DocumentReference myRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("guideFavourite")
        .doc(model.name);
    CollectionReference ref = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("guideFavourite")
        .doc(model.name)
        .collection("packages");

    await myRef.set(model.toJson());
    for (int i = 0; i < model.packages.length; i++) {
      ref.add(model.packages[i].toJson());
    }
    update();
  }

  Future<bool> isFavourite({required TourGuideModel model}) async {
    bool valid = false;
    CollectionReference myRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("guideFavourite");
    var result = await myRef.get();

    for (int i = 0; i < result.docs.length; i++) {
      if (result.docs[i].id == model.name) {
        valid = true;
        break;
      } else {
        valid = false;
      }
    }

    return valid;
  }
}
