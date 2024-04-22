import 'package:tu_cine_app/infrastructure/models/api_tucine/cineclub_response.dart';

abstract class UserDatasource{
  Future<dynamic> getUserByEmailAndPassword(String email, String password);
  Future<dynamic> createUser(UserPost user);
}