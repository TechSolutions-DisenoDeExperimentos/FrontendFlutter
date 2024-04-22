import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/infrastructure/datasources/api_moviedb/moviedb_datasource.dart';
import 'package:tu_cine_app/infrastructure/repositories/api_moviedb/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {

  return MovieRepositoryImpl(MoviedbDatasource());
});
