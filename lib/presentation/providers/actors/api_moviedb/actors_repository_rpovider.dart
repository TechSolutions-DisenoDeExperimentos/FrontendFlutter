import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/infrastructure/datasources/api_moviedb/actor_moviedb_datasource.dart';
import 'package:tu_cine_app/infrastructure/repositories/api_moviedb/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
