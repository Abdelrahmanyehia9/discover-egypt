import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../Egypt/data/model/place_model.dart';
import '../../../Guide/data/model/tour_guide_model.dart';
import '../../../Guide/data/model/tour_package.dart';
import '../../../Hotels/data/model/hotel_model.dart';

class FavouriteController extends GetxController {
  List<TourGuideModel> guideList = [];
  List<HotelModel> hotelList = [];
  List<PlaceModel> placesList = [] ;

  FavouriteController() {
    getFavouriteGuide();
    getFavouriteHotel();
    getFavouritePlaces() ;
  }

  Future<void> getFavouriteGuide() async {
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("guideFavourite");
    var result = await reference.get();

    for (int i = 0; i < result.docs.length; i++) {
      var pack = await reference
          .doc(result.docs[i].get("name"))
          .collection("packages")
          .get();
      guideList.add(TourGuideModel.fromJson(result.docs[i].data()));
      for (int j = 0; j < pack.docs.length; j++) {
        guideList[i]
            .packages
            .add(TourGuidePackageModel.fromJson(pack.docs[j].data()));
      }
    }

    update();
  }

  Future<void> getFavouriteHotel() async {
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("hotelFavourite");
    var result = await reference.get();

    for (int i = 0; i < result.docs.length; i++) {
      hotelList.add(HotelModel.fromJson(result.docs[i].data()));
    }

    update();
  }
  Future<void> getFavouritePlaces() async {
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("placeFavourite");
    var result = await reference.get();

    for (int i = 0; i < result.docs.length; i++) {
      placesList.add(PlaceModel.fromJson(result.docs[i].data()));
    }

    update();
  }
  Future<void> removeFavouritePlace({required PlaceModel model}) async {
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("placeFavourite");
    CollectionReference references = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("placeFavourite").doc(model.name).collection("thingsToDo");

    var result = await reference.get();
    var data = await references.get() ;
    for (int i = 0; i < result.docs.length; i++) {
      if (result.docs[i].id == model.name) {
        result.docs[i].reference.delete() ;
        for(int j = 0 ; j<data.docs.length ; j++){
          data.docs[i].reference.delete() ;
        }
      }
    }
    update();
  }
  Future<void> removeFavouriteGuide({required TourGuideModel model}) async {
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("guideFavourite");
    CollectionReference references = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("guideFavourite").doc(model.name).collection("packages");

    var result = await reference.get();
    var data = await references.get() ;
    for (int i = 0; i < result.docs.length; i++) {
      if (result.docs[i].id == model.name) {
        result.docs[i].reference.delete() ;
        for(int j = 0 ; j<data.docs.length ; j++){
          data.docs[i].reference.delete() ;
        }
      }
    }
    update();
  }
  Future<void> removeFavouriteHotel({required HotelModel model}) async {
    CollectionReference reference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("hotelFavourite");

    var result = await reference.get();
    for (int i = 0; i < result.docs.length; i++) {
      if (result.docs[i].id == model.name) {
        result.docs[i].reference.delete();
      }
    }
    update();
  }
}
