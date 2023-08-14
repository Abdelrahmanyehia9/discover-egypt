
import 'package:myegypt/features/Guide/data/model/tour_package.dart';

class TourGuideModel {
  final String location ;
  final String name;
  final String imagePath;
  final num phoneNumber;
  final String email;
  final int trips;
  final int liked;
  final bool isAvailable ;
   bool isLiked =true ;
  List<TourGuidePackageModel> packages = [] ;

  TourGuideModel( {

    required this.isAvailable,
    required this.name,
    required this.imagePath,
    required this.phoneNumber,
    required this.email,
    required this.trips,
    required this.liked,
    required this.location ,
  });


  factory TourGuideModel.fromJson( json)=>
      TourGuideModel(
        name: json['name'],
        imagePath: json['imagePath'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        trips: json['trips'],
        liked: json['liked'],
        location: json['location'],
        isAvailable:  json['isAvailable'] ,



      ) ;

toJson(){

  return{
    'name':name ,
    'imagePath':imagePath ,
    'phoneNumber':phoneNumber ,
    'email':email ,
    'trips' : trips  ,
    'liked': liked ,
    'location':location,
    'isAvailable': isAvailable,
  };
}
}