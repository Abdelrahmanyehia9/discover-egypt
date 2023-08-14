import 'package:myegypt/features/Guide/data/model/tour_package.dart';

class BookingTourGuideModel {
  final String packBy;
  final int numOfTrips;


  final String tittle;

  final List<dynamic> images;

  final int numOfPeople;

  final String totalPrice;

  final bool? status;

  final String imageOfPacker;
final String date ;
  BookingTourGuideModel({
    required this.numOfTrips,
    required this.numOfPeople,
    required this.totalPrice,
    required this.status,
    required this.imageOfPacker,
    required this.packBy,
    required this.tittle,
    required this.images,
    required this.date ,
  });


 factory BookingTourGuideModel.fromJson(json) =>
      BookingTourGuideModel(
          numOfTrips: json['numOfTrips'],
          numOfPeople: json["numOfAdults"],
          totalPrice: json["total price"],
          status: json["status"],
          imageOfPacker: json["imgOfPack"],
          packBy: json["packTo"],
          tittle: json["trips"],
          images: json["images"] ,
        date:  json['dateOfTrips']
      );



 toJson(){
   return{
     "numOfTrips":numOfTrips ,
     "numOfAdults":numOfPeople ,
     "total price":totalPrice ,
     "status":status ,
     "imgOfPack":imageOfPacker,
     "packTo":packBy ,
     "trips":tittle,
     "images":images,
     "dateOfTrips":date
   };


 }
}
