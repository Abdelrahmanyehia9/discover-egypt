import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myegypt/constant.dart';
import 'package:myegypt/features/Hotels/data/model/book_hotel_model.dart';
import '../../data/model/hotel_model.dart';

class HotelViewModel extends GetxController {
  bool isLikes = false ;
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  final CollectionReference _hotelModel = FirebaseFirestore.instance.collection("hotel");
  final List<HotelModel> _hotelList = [];
  final List<Widget> hotelImage = [];
  List<HotelModel> get hotelList => _hotelList;
  HotelViewModel() {
    getHotels();
  }

  getHotels() async {
    _loading.value = true;
    var data = await _hotelModel.get();
    for (int i = 0; i < data.docs.length; i++) {
      _hotelList.add(
        HotelModel.fromJson(
          data.docs[i].data(),
        ),
      );
      hotelImage.add(
        CachedNetworkImage(
          imageUrl: _hotelList[i].imagePath,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(placeHolder),
        ),
      );
      _hotelList[i].isLiked = await isFavourite(model: _hotelList[i]);
      _loading.value = false;
    }
    update();
  }


  Future<void> addToMyFavourite({required HotelModel model}) async {
    isLikes = true ;
    DocumentReference myRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("hotelFavourite")
        .doc(model.name);

    await myRef.set(model.toJson());

    update() ;
  }
  Future<bool> isFavourite({required HotelModel model}) async {
    bool valid = false;
    CollectionReference myRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("hotelFavourite");
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
