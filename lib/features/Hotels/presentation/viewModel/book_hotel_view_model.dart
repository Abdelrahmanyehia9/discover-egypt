import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myegypt/features/home/presentation/controller/bookings.dart';

import '../../../home/presentation/view/bookins.dart';
import '../../data/model/book_hotel_model.dart';

class BookHotelViewModel extends GetxController {
  final CollectionReference _bookedHotel = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("HotelBooking");
  static DateTime range = DateTime.now();




  bool valid = true;


  Future<void> ifValid(BookHotelModel model) async {
var data = await  _bookedHotel.get() ;
for(int i = 0 ; i< data.docs.length ; i++ ){
  if (data.docs[i].get("status") == null ){
    valid = false ;
  }
  else{
    valid = true ;
  }
  
}
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
      required String rate,
      required String pic,
      required String price,
      required String dateFrom,
      required int numOfDays,
      required int adults,
      required int children ,
      bool? status}) async {
    BookHotelModel model = BookHotelModel(
        status: status,
        hotelPic: pic,
        hotelPrice: price,
        hotelRate: rate,
        email: FirebaseAuth.instance.currentUser!.email!,
        username: 'SignUpUserInfo.username!',
        hotelName: hotelName,
        country: 'SignUpUserInfo.country!',
        dateFrom: dateFrom,
        numOfDays: numOfDays,
        adults: adults,
        children: children);
    Get.defaultDialog(
        title: 'book hotel ',
        content: Text(
            " it  totally  cost ${((double.parse(model.hotelPrice)* model.numOfDays)*(model.adults + model.children*0.5)).toStringAsFixed(2)}\$"),
        textCancel: "no",
        textConfirm: "Confirm",
        confirmTextColor: Colors.white,
        onConfirm: ()async{

          valid = true ;
         await ifValid(model) ;
        } , onCancel: (){

      valid = false ;
      Get.back() ;
    }

    );

  }
}
