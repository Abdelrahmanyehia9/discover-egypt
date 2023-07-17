class TourGuidePackageModel {
  final double? rating   ;
  final String tittle;
  final String subTittle;
  final String price;
  final List<String> images;
  final List<String>? opening;
  TourGuidePackageModel({
    this.rating ,
    this.opening , 
    required this.tittle,
    required this.subTittle,
    required this.price,
    required this.images,
  });


}
