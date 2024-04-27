import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';

abstract class UserDatasource {
  Future<dynamic> getUserByEmailAndPassword(String email, String password);
  Future<dynamic> createUser(UserPost user);
  Future<dynamic> getUserById(String userId);
}
