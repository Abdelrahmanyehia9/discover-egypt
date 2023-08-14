class TourGuidePackageModel {
  final String? rating;
  final String tittle;
  final String subTittle;
  final String price;
  final List<dynamic> images;
  final List<String>? opening;

  TourGuidePackageModel({
    this.rating,
    this.opening,
    required this.tittle,
    required this.subTittle,
    required this.price,
    required this.images,
  });

  factory TourGuidePackageModel.fromJson(json) => TourGuidePackageModel(
      tittle: json['tittle'],
      subTittle: json['subTittle'],
      price: json['price'],
      images: json['images']
  );

toJson(){

  return{
    'tittle': tittle  ,
    'subTittle':subTittle,
    'opening': opening,
    'price': price,
    "images":images,
    'rating':rating,



  };


}

}