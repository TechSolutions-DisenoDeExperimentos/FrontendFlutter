class TicketResponse {
  final int id;
  final int numberSeats;
  final int totalPrice;
  final String status;
  final String dateEmition;
  final User user;
  final Showtime showtime;

  TicketResponse(
      {required this.id,
      required this.numberSeats,
      required this.totalPrice,
      required this.status,
      required this.dateEmition,
      required this.user,
      required this.showtime});

  factory TicketResponse.fromJson(Map<String, dynamic> json) => TicketResponse(
        id: json['id'],
        numberSeats: json['numberSeats'],
        totalPrice: json['totalPrice'],
        status: json['status'],
        dateEmition: json['dateEmition'],
        //user: json['user'] != null ? new User.fromJson(json['user']) : null,
        user: User.fromJson(json['user']),
        showtime: Showtime.fromJson(json['showtime']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'numberSeats': numberSeats,
        'totalPrice': totalPrice,
        'status': status,
        'dateEmition': dateEmition,
        'user': user.toJson(),
        'showtime': showtime.toJson(),
      };
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String birthdate;
  final String phone;
  final String email;
  final String createdAt;
  final String dni;
  final String password;
  final String imageSrc;
  final String bankAccount;
  final String address;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.birthdate,
      required this.phone,
      required this.email,
      required this.createdAt,
      required this.dni,
      required this.password,
      required this.imageSrc,
      required this.bankAccount,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        birthdate: json['birthdate'],
        phone: json['phone'],
        email: json['email'],
        createdAt: json['createdAt'],
        dni: json['dni'],
        password: json['password'],
        imageSrc: json['imageSrc'],
        bankAccount: json['bankAccount'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'birthdate': birthdate,
        'phone': phone,
        'email': email,
        'createdAt': createdAt,
        'dni': dni,
        'password': password,
        'imageSrc': imageSrc,
        'bankAccount': bankAccount,
        'address': address,
      };
}

class Showtime {
  final int id;
  final String playDate;
  final String playTime;
  final int capacity;
  final int unitPrice;

  Showtime(
      {required this.id,
      required this.playDate,
      required this.playTime,
      required this.capacity,
      required this.unitPrice});

  factory Showtime.fromJson(Map<String, dynamic> json) => Showtime(
        id: json['id'],
        playDate: json['playDate'],
        playTime: json['playTime'],
        capacity: json['capacity'],
        unitPrice: json['unitPrice'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'playDate': playDate,
        'playTime': playTime,
        'capacity': capacity,
        'unitPrice': unitPrice,
      };
}
