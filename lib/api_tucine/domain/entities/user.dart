class User {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime birthdate;
  final String phone;
  final String email;
  final DateTime createdAt;
  final String dni;
  final String password;
  final String? imageSrc;
  final String? bankAccount;
  final dynamic typeUser;
  final dynamic gender;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.dni,
    required this.password,
    this.imageSrc,
    this.bankAccount,
    required this.typeUser,
    required this.gender,
  });

}
