import 'package:tu_cine_app/api_tucine/infrastructure/datasources/cineclub_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/repositories/cineclub_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cineclubRepositoryProvider = Provider((ref) {

  return CineclubRepositoryImpl(CineclubDatasource());
});
