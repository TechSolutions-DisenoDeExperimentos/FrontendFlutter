import 'package:tu_cine_app/api_tucine/domain/entities/user.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';

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
        imageSrc: userResponse.imageSrc != null ? '${userResponse.imageSrc}' : 'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg',
        bankAccount: userResponse.bankAccount != null ? '${userResponse.bankAccount}' : 'No hay información',
      );
}