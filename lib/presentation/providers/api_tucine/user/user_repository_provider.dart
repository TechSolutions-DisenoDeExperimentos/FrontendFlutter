
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/user_tucine_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/repositories/user_repository_impl.dart';

final userRepositoryProvider = Provider((ref) {
  return UserRepositoryImpl(UserTuCineDataSource());
});