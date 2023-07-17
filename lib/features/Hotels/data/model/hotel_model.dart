class HotelModel {

  final String name;
  final String imagePath  ;
  final String location ;

  HotelModel(
  { required this.name, required this.imagePath, required  this.location }
      );

  factory HotelModel.fromJson(json)=>
      HotelModel(
          name: json['name'], imagePath: json['imagePath'], location: json['location']
      ) ;











}