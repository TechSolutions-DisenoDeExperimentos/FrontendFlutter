import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/infrastructure/datasources/api_tucine/cineclub_datasource.dart';
import 'package:tu_cine_app/infrastructure/repositories/api_tucine/cineclub_repository_impl.dart';

final cineclubRepositoryProvider = Provider((ref) {

  return CineclubRepositoryImpl(CineclubDatasource());
});
