import 'package:tu_cine_app/api_tucine/domain/datasources/user_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/user.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/user_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';
import 'package:dio/dio.dart';

class UserTuCineDataSource extends UserDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

  List<User> _jsonToUsers(List<dynamic> json) {
    final List<User> users = json.map((data) {
      final userResponse = UserResponse.fromJson(data);
      return UserMapper.userToEntity(userResponse);
    }).toList();

    return users;
  }

  @override
  Future<dynamic> getUserByEmailAndPassword(
      String email, String password) async {
    try {
      Response user = await dio.post("/users/auth/sign-in",
          data: {"email": email, "password": password});
      return UserResponse.fromJson(user.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error de respuesta de Dio: ${e.response?.data}');
      } else {
        print('Error de solicitud de Dio: ${e.requestOptions.path}');
      }
      return null;
    }
  }

  @override
  Future<dynamic> createUser(UserPost user) async {
    try {
      Response response = await dio.post("/users/auth/sign-up", data: user.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
      on DioException catch (e) {
      if (e.response != null) {
        print('Error de respuesta de Dio: ${e.response?.data}');
      } else {
        print('Error de solicitud de Dio: ${e.requestOptions.path}');
      }
      return false;
    }
  }
  
  @override
  Future getUserById(String userId) async {
    final response = await dio.get('users/userid/$userId');
    return _jsonToUsers(response.data);
  }
}
