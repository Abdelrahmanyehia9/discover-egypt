class BookHotelModel {
  final String email;
  final String username;
  final String hotelName;
  final String country;
  final String dateFrom;
  final int numOfDays;
  final int adults;
  final int children;
  final String hotelPic;

  final String hotelRate;

  final String hotelPrice;

  final bool? status;

  BookHotelModel(
      {required this.email,
      required this.username,
      required this.hotelName,
      required this.country,
      required this.dateFrom,
      required this.numOfDays,
      required this.adults,
      required this.children,
      required this.hotelPic,
      required this.hotelPrice,
      required this.hotelRate,
      this.status});

  toJson() {
    return {
      "email": email,
      "username": username,
      "hotel name": hotelName,
      "country": country,
      "date from": dateFrom,
      "numOfDay": numOfDays,
      "adults": adults,
      "children": children,
      "hotelPic": hotelPic,
      "hotelPrice": hotelPrice,
      "hotelRate": hotelRate,
      'status': status
    };
  }

  factory BookHotelModel.fromJson(json) {
    return BookHotelModel(
        email: json['email'],
        username: json['username'],
        hotelName: json['hotel name'],
        country: json['country'],
        dateFrom: json['date from'],
        numOfDays: json['numOfDay'],
        adults: json['adults'],
        children: json['children'],
        hotelPic: json['hotelPic'],
        hotelPrice: json['hotelPrice'],
        hotelRate: json['hotelRate'],
        status: json['status']);
  }
}
