class PlaceModel {
  final String name;
  final String image;
  final String overview;
  final String crowded;
  final String space;
  final String languge;
  final String? temp ;
  final String? weather ;
  final List<dynamic>? weatherExpectation ;
  bool isLiked =true ;
  List<ThingsToDoModel> thingsTodo = []  ;

  PlaceModel(
      {required this.name,
        this.weather ,
        this.temp ,
        this.weatherExpectation ,
      required this.image,
      required this.overview,
      required this.crowded,
      required this.languge,
      required this.space});

  factory PlaceModel.fromJson(json) {
    return PlaceModel(
        name: json["name"],
        image: json["image"],
        overview: json['overview'],
        crowded: json['crowded'],
        space: json['space'],
        languge: json['lang'] ,
        temp: json['weather'] ,
      weather: json['weatherOverview'] ,
      weatherExpectation: json['weatherExpectation'] ,
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'overview': overview,
      'crowded': crowded,
      'space': space,
      'lang': languge ,
      "weather":temp ,
      "weatherOverview" : weather ,
      "weatherExpectation":weatherExpectation
    };
  }
}

class ThingsToDoModel {
  final String tittle;
  final String subTittle;
  final String imagePath;
  final bool isRecommended;
  final String price ;
  final String? open ;

  ThingsToDoModel({
     this.open,
    required this.price,
    required this.tittle,
    required this.subTittle,
    required this.imagePath,
    required this.isRecommended,
  });

  factory ThingsToDoModel.fromJson(json) => ThingsToDoModel(
      tittle: json['tittle'],
      subTittle: json['subTittle'],
      imagePath: json['imagePath'],
      isRecommended: json['isRecommended'],
    price: json['price'],
    open: json['open']


  );

  toJson() {
    return {

      'tittle': tittle,
      'subTittle': subTittle,
      'imagePath': imagePath,
      'isRecommended': isRecommended
    };
  }
}
