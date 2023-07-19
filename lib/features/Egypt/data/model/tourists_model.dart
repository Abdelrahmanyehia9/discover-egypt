class TouristsModel{

  final String name ;
  final String image ;



  TouristsModel({required this.name ,required this.image}) ;

  factory TouristsModel.fromJson(json){
    return TouristsModel(name: json["name"]  , image: json["image"]);
  }



  toJson(){
    return{
      'name':name ,
      'image':image
    } ;
  }
}