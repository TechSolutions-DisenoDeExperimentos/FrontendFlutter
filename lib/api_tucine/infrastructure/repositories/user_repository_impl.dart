import 'package:tu_cine_app/api_tucine/domain/datasources/user_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/user.dart';
import 'package:tu_cine_app/api_tucine/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<User> getUserById(String id) async {
    return await userDataSource.getUserById(id);
  }
  
  @override
  Future getUserByEmailAndPassword(String email, String password) {
    return userDataSource.getUserByEmailAndPassword(email, password);
  }
}