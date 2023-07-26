class BookHotelModel {
  final String email;
  final String username;
  final String hotelName;
  final String country;
  final String dateFrom;
  final int numOfDays;
  final int adults;
  final int children;

  BookHotelModel(
      {required this.email,
      required this.username,
      required this.hotelName,
      required this.country,
      required this.dateFrom,
      required this.numOfDays,
      required this.adults,
      required this.children});

  toJson() {
    return {
      "email": email,
      "username": username,
      "hotel name": hotelName,
      "country": country,
      "date from": dateFrom,
      "numOfDay": numOfDays,
      "adults": adults,
      "children": children
    };
  }
}
