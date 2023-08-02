import 'package:cloud_firestore/cloud_firestore.dart';

class ImagesModel {
  final String images;

  final Timestamp dateTime;

  ImagesModel({required this.images, required this.dateTime});


  factory ImagesModel.fromJson(json){

    return ImagesModel(images:json['imagePath'], dateTime: json['TimeOfUpload']) ;

  }
}
