import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../data/model/tour_package.dart';

class PackViewModel extends  GetxController{
  
  
  
  final CollectionReference _package = FirebaseFirestore.instance.collection("touGuides").doc('messi').collection('packages') ;
    final List<TourGuidePackageModel> _tourGuidePack = [] ;
    List<TourGuidePackageModel> get tourGuidePack => _tourGuidePack ;
  
  PackViewModel(){

    getPack();
    print(_tourGuidePack[0].tittle) ;

  }
  void getPack()async{

    var data = await _package.get() ;
    for(int i = 0 ; i< data.docs.length ; i++ ){

      _tourGuidePack.add(TourGuidePackageModel.fromJson(data.docs[1].data())) ;

    }
update();
  }
  
}