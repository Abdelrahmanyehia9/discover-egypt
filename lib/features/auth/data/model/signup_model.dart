class SignUpModel {
  final String userName;
  final String email;
  final String passWord;
  final String? country;
  final String dateOfReges;
  final bool? isMale;
  final String? birthDate;
  final String? imagePath;

  SignUpModel(
      {
       this.imagePath,
      this.birthDate,
      required this.userName,
      required this.email,
      required this.passWord,
      this.country,
      required this.dateOfReges,
      this.isMale});

  factory SignUpModel.fromJson(json) {
    return SignUpModel(
        userName: json['username'],
        email: json['email'],
        passWord: json['password'],
        country: json['country'],
        dateOfReges: json['date'],
        isMale: json['isMale'],
        birthDate: json['"birthDate"'],
        imagePath: json['imagePath'] ,
    );
  }

  toJson()
  {
    return {
      'username': userName,
      'email': email,
      'password': passWord,
      'country': country,
      'date': dateOfReges,
      "isMale": isMale,
      'birthDate': birthDate,
      'imagePath': imagePath
    };
  }
}
