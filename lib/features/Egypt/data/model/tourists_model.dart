class TouristsModel {
  final String name;
  final String image;
  final String? country;
  final String? dateComing;
  final String? mobile;
  final String? birthDate;
  final bool? isMale;

  TouristsModel(
      {this.birthDate,
      this.isMale,
      this.country,
      this.dateComing,
      this.mobile,
      required this.name,
      required this.image});

  factory TouristsModel.fromJson(json) {
    return TouristsModel(name: json["name"], image: json["image"]);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'mobileNum': mobile,
      "dateComing": dateComing,
      'country': country,
      'birthday': birthDate,
      'isMale': isMale
    };
  }
}
