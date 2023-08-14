import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Egypt/presentation/view/place_details/things_to_do.dart';

import '../../data/model/place_model.dart';

class PlacesViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<PlaceModel> get places => _placesModelList;
  final List<PlaceModel> _placesModelList = [];

  final CollectionReference _placesModel =
      FirebaseFirestore.instance.collection("places");

  PlacesViewModel() {
    getPlaces();
  }

  Future<void> getPlaces() async {
    _loading.value = true;

    var result = await _placesModel.get();
    for (int i = 0; i < result.docs.length; i++) {
      var thingsToDo = await _placesModel
          .doc(result.docs[i].id)
          .collection("thingsToDo")
          .get();
      _placesModelList.add(PlaceModel.fromJson(result.docs[i].data()));
      for (int j = 0; j < thingsToDo.docs.length; j++) {
        _placesModelList[i].thingsTodo.add(ThingsToDoModel.fromJson(thingsToDo.docs[j].data()));
        _placesModelList[i].isLiked =await isFavourite(model: _placesModelList[i]);
      }
      _loading.value = false;
    }
    update();
  }
  Future<void> addToMyFavourite({required PlaceModel model}) async {
    DocumentReference myRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("placeFavourite")
        .doc(model.name);
    CollectionReference ref = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("placeFavourite")
        .doc(model.name)
        .collection("thingsToDo");

    await myRef.set(model.toJson());
    for (int i = 0; i < model.thingsTodo.length; i++) {
      ref.add(model.thingsTodo[i].toJson());
    }

    update() ;
  }
  Future<bool> isFavourite({required PlaceModel model}) async {
    bool valid = false;
    CollectionReference myRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("placeFavourite");
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
  // Future<void> addThingsTodo(int index, ThingsToDoModel thModel) async {
  //   var data = await _placesModel.get();
  //   var name = data.docs[index].id;
  //   ThingsToDoModel model = ThingsToDoModel(
  //       tittle: thModel.tittle,
  //       subTittle: thModel.subTittle,
  //       imagePath: thModel.imagePath,
  //       isRecommended: thModel.isRecommended);
  //   CollectionReference thingsTodo =
  //       _placesModel.doc(name).collection("thingsToDo");
  //   thingsTodo.add(model.toJson());
  // }
}
