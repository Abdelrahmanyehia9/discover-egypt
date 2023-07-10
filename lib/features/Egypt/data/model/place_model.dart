class PlaceModel{

 final String name ;
  final String image ;



  PlaceModel({required this.name ,required this.image}) ;

  factory PlaceModel.fromJson(json){
    return PlaceModel(name: json["name"]  , image: json["image"]);
  }



  toJson(){
    return{
      'name':name ,
      'image':image
    } ;
  }
}