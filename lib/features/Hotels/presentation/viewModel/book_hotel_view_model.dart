import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/model/book_hotel_model.dart';

class BookHotelViewModel extends GetxController {
  final CollectionReference _bookedHotel = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("HotelBooking");
  static DateTimeRange range = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  static int numOfDays = 0;
  static int adults = 1;
  static int children = 1;
  bool valid = true;
  Future<void> validateDuplicate() async {
    var data = await _bookedHotel.get();
    if (data.docs.isEmpty){
      valid = true ;
    }
    else {
      for (int i = 0; i < data.docs.length; i++) {
        if ((DateTime.now().year == DateTime.parse(data.docs[i].id).year &&
            DateTime.now().month == DateTime.parse(data.docs[i].id).month &&
            DateTime.now().day ==
                DateTime.parse(data.docs[i].id)
                    .add(const Duration(hours: 10, minutes: 14))
                    .day)) {
          valid = false;
          break;
        } else {
          valid = true;
        }
      }
    }
  }
  void ifValid(BookHotelModel model)async{

    await validateDuplicate() ;
    if (valid) {
      _bookedHotel.doc(DateTime.now().toString()).set(model.toJson());
      Get.snackbar("submitted", 'your Hotel has been reserved',
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("error", 'too many request try again later',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }

  }

  bookHotel(
      {required String hotelName,
      required String dateFrom,
      required int numOfDays,
      required int adults,
      required int children}) {
    BookHotelModel model = BookHotelModel(
        email: FirebaseAuth.instance.currentUser!.email!,
        username: 'SignUpUserInfo.username!',
        hotelName: hotelName,
        country: 'SignUpUserInfo.country!',
        dateFrom: dateFrom,
        numOfDays: numOfDays,
        adults: adults,
        children: children);
       ifValid(model) ;

  }

  }

