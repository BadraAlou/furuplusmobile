// models/reservation.dart

class Reservation {
  final int packId;
  final String date;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String weddingDate;
  final String address;
  final String? packName;

  Reservation({
    required this.packId,
    required this.date,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.weddingDate,
    required this.address,
    this.packName
  });

  Map<String, dynamic> toJson() {
    return {
      'pack': packId,
      'date': date,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'wedding_date': weddingDate,
      'address': address,
    };
  }

  Map<String, dynamic> toJsonLocale() {
    return {
      'pack': packId,
      'date': date,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'wedding_date': weddingDate,
      'address': address,
      'packName': packName
    };
  }



  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      packId: json['pack'],
      date: json['date'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      weddingDate: json['wedding_date'],
      address: json['address'],

      packName: json['packName'] ?? '',
    );
  }
}
