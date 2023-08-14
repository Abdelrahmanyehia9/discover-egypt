import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Guide/data/model/bookingtourGuide.dart';
import 'package:myegypt/features/Guide/data/model/tour_guide_model.dart';
import 'package:myegypt/features/Hotels/data/model/book_hotel_model.dart';

class BookingsController extends GetxController {
  final CollectionReference referenceHotel = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("HotelBooking");

  final CollectionReference referenceGuide = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("BookGuide");

  final List<BookHotelModel> _bookingsHotelList = [];
  final List<BookingTourGuideModel> _bookingGuideList = [];

  BookHotelModel? upComingHotel;
  BookingTourGuideModel? upComingGuide;

  List<BookHotelModel> completedHotel = [];
  List<BookingTourGuideModel> completedGuide = [];

  List<BookHotelModel> get bookingHotelList => _bookingsHotelList;

  List<BookingTourGuideModel> get bookingGuideList => _bookingGuideList;

  BookingsController() {
    getHotelBooking();
    getGuideBooking();
  }

  Future<void> getHotelBooking() async {
    var data = await referenceHotel.get();
    for (int i = 0; i < data.docs.length; i++) {
      _bookingsHotelList.add(BookHotelModel.fromJson(data.docs[i].data()));
      if (data.docs[i].get("status") == null) {
        upComingHotel = _bookingsHotelList[i];
      } else {
        completedHotel.add(_bookingsHotelList[i]);
      }
    }

    update();
  }

  Future<void> getGuideBooking() async {
    var data = await referenceGuide.get();
    for (int i = 0; i < data.docs.length; i++) {
      _bookingGuideList
          .add(BookingTourGuideModel.fromJson(data.docs[i].data()));
      if (data.docs[i].get("status") == null) {
        upComingGuide = _bookingGuideList[i];
      } else {
        completedGuide.add(_bookingGuideList[i]);
      }

      print(upComingGuide?.date ?? "koso");
    }

    update();
  }

  Future<void> removeHotel() async {
    var data = await referenceHotel.get();
    for (int i = 0; i < data.docs.length; i++) {
      if (data.docs[i].get("status") == null) {
        data.docs[i].reference.delete();
      }
    }
    upComingHotel = null;
    update();
  }

  Future<void> removeGuide() async {
    var data = await referenceGuide.get();
    for (int i = 0; i < data.docs.length; i++) {
      if (data.docs[i].get("status") == null) {
        data.docs[i].reference.delete();
      }
    }
    upComingGuide = null;
    update();
  }
}
