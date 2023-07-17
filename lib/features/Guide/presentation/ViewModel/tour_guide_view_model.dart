import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myegypt/core/utils/standard_packages.dart';

import '../../data/model/tour_guide_model.dart';

class TourGuideViewModel extends GetxController{
  
 final List<TourGuideModel> _listOfTour =[] ;
 List<TourGuideModel> get listOfTour => _listOfTour ;
 final CollectionReference _tourGuide = FirebaseFirestore.instance.collection("touGuides") ;



 TourGuideViewModel(){
    getTourGuide() ;
  }
  
  
  getTourGuide()async {
    var data = await _tourGuide.get();

    for (int i = 0; i < data.docs.length; i++) {
      _listOfTour.add(TourGuideModel.fromJson(data.docs[i].data())) ;

    }
    _listOfTour[0].packages =crisPack ;
    _listOfTour[1].packages = lioPack ;
    update() ;
  }
  
}