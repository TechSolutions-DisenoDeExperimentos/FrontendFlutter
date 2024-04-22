import 'package:cine_app/api_tucine/domain/entities/user.dart';
import 'package:cine_app/api_tucine/infrastructure/models/cineclub_response.dart';

class UserMapper {
  static User userToEntity(UserResponse userResponse) => User(
        id: userResponse.id,
        firstName: userResponse.firstName,
        lastName: userResponse.lastName,
        birthdate: userResponse.birthdate,
        phone: userResponse.phone,
        email: userResponse.email,
        createdAt: userResponse.createdAt,
        dni: userResponse.dni,
        password: userResponse.password,
        typeUser: userResponse.typeUser,
        gender: userResponse.gender,
        imageSrc: userResponse.imageSrc != null ? '${userResponse.imageSrc}' : 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq',
        bankAccount: userResponse.bankAccount != null ? '${userResponse.bankAccount}' : 'No hay información',
      );
}