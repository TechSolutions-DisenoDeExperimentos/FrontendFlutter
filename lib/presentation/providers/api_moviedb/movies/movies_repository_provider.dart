

import 'package:tu_cine_app/api_moviedb/infrastructure/datasources/moviedb_datasource.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//IT'S IMMUATABLE
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDatasource() );
});