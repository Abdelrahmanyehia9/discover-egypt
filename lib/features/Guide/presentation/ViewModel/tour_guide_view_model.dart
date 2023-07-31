import 'package:cloud_firestore/cloud_firestore.dart';
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

  TourGuideViewModel() {
    getTourGuide();
  }

  getTourGuide() async {
    _loading.value = true;
    var data = await _tourGuide.get();

    for (int i = 0; i < data.docs.length; i++) {
      _listOfTour.add(TourGuideModel.fromJson(data.docs[i].data()));
    }
    _listOfTour[0].packages = crisPack;
    _listOfTour[1].packages = lioPack;
    _loading.value = false;
    update();
  }

  void addPackage() async {
    TourGuidePackageModel pack = TourGuidePackageModel(
        tittle: as1.tittle,
        subTittle: as1.subTittle,
        price: as1.price,
        images: as1.images,
        opening: as1.opening,
        rating: as1.rating);
    final CollectionReference tourPackage =
        _tourGuide.doc('cristiano').collection('packages');
    tourPackage.add(pack.toJson());
    print('pack add  ');
  }

  void addPackToGuide(String guideName) async {
    final CollectionReference ref = FirebaseFirestore.instance
        .collection("touGuides")
        .doc(guideName)
        .collection('packages');
    var data = await ref.get();
    for (int i = 0; i < data.docs.length; i++) {}
  }
}
