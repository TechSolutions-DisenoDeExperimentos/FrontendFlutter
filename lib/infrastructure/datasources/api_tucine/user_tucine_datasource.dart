import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_tucine/user_datasource.dart';
import 'package:tu_cine_app/infrastructure/models/api_tucine/cineclub_response.dart';

class UserTuCineDataSource extends UserDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.theTuCineBaseUrl,
  ));

  @override
  Future<dynamic> getUserByEmailAndPassword(
      String email, String password) async {
    try {
      Response user = await dio.post("/users/auth/sign-in",
          data: {"email": email, "password": password});
      return UserResponse.fromJson(user.data);
    } on DioException catch (e) {
      if (e.response != null) {
        //print('Error de respuesta de Dio: ${e.response?.data}');
      } else {
        //print('Error de solicitud de Dio: ${e.requestOptions.path}');
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
        //print('Error de respuesta de Dio: ${e.response?.data}');
      } else {
        //print('Error de solicitud de Dio: ${e.requestOptions.path}');
      }
      return false;
    }
  }
}
