
//IT'S IMMUATABLE
import 'package:tu_cine_app/api_moviedb/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});