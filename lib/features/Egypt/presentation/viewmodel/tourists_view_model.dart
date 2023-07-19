import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myegypt/features/Egypt/data/model/tourists_model.dart';

class TouristsViewModel extends GetxController{


  final CollectionReference _tourists = FirebaseFirestore.instance.collection("tourists") ;
  List<TouristsModel> get tourists =>_touristsList ;
  final List<TouristsModel> _touristsList = [] ;

TouristsViewModel(){

  getTourist();

}

  getTourist()async{
    var result = await _tourists.get();
    for( int i = 0 ; i<result.docs.length ; i++){
      _touristsList.add(TouristsModel.fromJson(result.docs[i].data())) ;

    }
    update();

  }









}