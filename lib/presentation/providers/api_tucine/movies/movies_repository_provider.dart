import 'package:tu_cine_app/api_tucine/infrastructure/datasources/movietucine_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovietucineDatasource());
});
