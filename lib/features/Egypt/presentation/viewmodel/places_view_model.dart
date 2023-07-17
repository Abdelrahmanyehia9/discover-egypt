import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/place_model.dart';

class PlacesViewModel extends GetxController{
   ValueNotifier<bool> get loading =>_loading;
  final ValueNotifier<bool>_loading = ValueNotifier(false);
  List<PlaceModel> get places =>_placesModelList ;
  final List<PlaceModel> _placesModelList = [] ;
   List<PlaceModel> get tourists =>_touristsList ;
   final List<PlaceModel> _touristsList = [] ;
  final CollectionReference _placesModel = FirebaseFirestore.instance.collection("places") ;
   final CollectionReference _tourists = FirebaseFirestore.instance.collection("tourists") ;

  PlacesViewModel(){

    getPlaces() ;
    getTourist()  ;
  }

getPlaces() async {
_loading.value = true ;

  var result = await _placesModel.get();
for( int i = 0 ; i<result.docs.length ; i++){
  _placesModelList.add(PlaceModel.fromJson(result.docs[i].data())) ;
_loading.value = false ;

}
update();
}
getTourist()async{
    loading.value = true ;
    var result = await _tourists.get();
    for( int i = 0 ; i<result.docs.length ; i++){
      _touristsList.add(PlaceModel.fromJson(result.docs[i].data())) ;
      _loading.value = false ;

    }
    update();

}









}