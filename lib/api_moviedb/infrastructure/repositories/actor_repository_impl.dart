
import 'package:tu_cine_app/api_moviedb/domain/datasources/actors_datasource.dart';
import 'package:tu_cine_app/api_moviedb/domain/entities/actor.dart';
import 'package:tu_cine_app/api_moviedb/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

}