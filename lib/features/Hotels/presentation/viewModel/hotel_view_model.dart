import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/hotel_model.dart';

class HotelViewModel extends GetxController {

  ValueNotifier<bool> get loading =>_loading;
  final ValueNotifier<bool>_loading = ValueNotifier(false);
  final CollectionReference _hotelModel = FirebaseFirestore.instance.collection("hotel") ;
  final List<HotelModel>_hotelList = []  ;
  List<HotelModel> get hotelList => _hotelList ;

  HotelViewModel(){

    getHotels() ;
  }


  getHotels()async{
    _loading.value=true;
    var data = await _hotelModel.get() ;
    for (int i = 0; i<data.docs.length ; i++){
      _hotelList.add(HotelModel.fromJson(data.docs[i].data())) ;
      _loading.value= false ;
    }
    update() ;
  }



}
