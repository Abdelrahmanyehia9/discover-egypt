class PlaceModel {
  final String name;
  final String image;
  final String overview;
  final String crowded;
  final String space;
  final String languge;

  PlaceModel(
      {required this.name,
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
        languge: json['lang']);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'overview': overview,
      'crowded': crowded,
      'space': space,
      'lang': languge
    };
  }
}
