class HotelModel {
  final String name;
  final String imagePath;
  final String location;
  final String overView;
  final String price;
  final int rating;
  final bool isRecommended;

  HotelModel(
    { required this.overView,
      required this.price,
      required this.rating,
      required this.isRecommended,
      required this.name,
      required this.imagePath,
      required this.location,
  });

  factory HotelModel.fromJson(json) => HotelModel(
      name: json['name'],
      rating: json['rating'] ,
      isRecommended : json['isRecommended'] ,
      price: json['price'] ,
      overView: json['overView'] ,
      imagePath: json['imagePath'],
      location: json['location']);
}
