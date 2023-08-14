import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/home/presentation/view/toggle_pages.dart';
import '../../data/model/tour_package.dart';

class BookingTourGuideController extends GetxController {
  Set<TourGuidePackageModel> tourGuideSet = {};
  CollectionReference ref = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("BookGuide");
  double totalPrice = 0;
  bool valid = false;

  void addToCart(TourGuidePackageModel model) {
    tourGuideSet.add(model);
    calcTotalPrice();
    update();
  }

  void removeFromCart(TourGuidePackageModel model) {
    tourGuideSet.remove(model);
    calcTotalPrice();
    update();
  }

  void calcTotalPrice() {
    double price = 0;
    for (int i = 0; i < tourGuideSet.length; i++) {
      price += double.parse(tourGuideSet.toList()[i].price);
    }

    totalPrice = price;
    update();
  }

  void removeAllCard() {
    tourGuideSet = {};
    update();
  }

  Future<void> bookingToDatabase(
      {required String guideName,
      required String date,
      required int numOfPeople,
      required String country,
      required String price,
      required String imgOfPack,
      required List<TourGuidePackageModel> model}) async {
    String trips = "";

    CollectionReference ref2 = FirebaseFirestore.instance
        .collection("touGuides")
        .doc(guideName)
        .collection("Bookings");
    for (int i = 0; i < model.length; i++) {
      trips += "${model[i].tittle},";
    }
    await ifValid();
    if (valid) {
      ref.add({
        "packTo": guideName,
        "imgOfPack": imgOfPack,
        "numOfTrips": model.length,
        "trips": trips,
        "dateOfTrips": date,
        "numOfAdults": numOfPeople,
        "country": country,
        "total price": price,
        "status": null,
        'images': model[0].images
      });
      ref2.add({
        "numOfTrips": model.length,
        "trips": trips,
        "dateOfTrips": date,
        "numOfAdults": numOfPeople,
        "country": country,
        "total price": price,
        'status': null
      });
      Get.to(() => TogglePages(currentIndex: 2));
    } else {
      Get.back();
      Get.snackbar("error", "you have un completed booking",
          backgroundColor: Colors.red,
          snackStyle: SnackStyle.GROUNDED,
          snackPosition: SnackPosition.BOTTOM);
    }
    print(valid);
  }

  Future<void> ifValid() async {
    var data = await ref.get();
    if (data.docs.isEmpty) {
      valid = true;
    } else {
      for (int i = 0; i < data.docs.length; i++) {
        if (data.docs[i].get("status") == null) {
          valid = false;
        } else {
          valid = true;
        }
      }
    }
  }
}
