import 'package:tu_cine_app/api_tucine/domain/datasources/actors_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/actor.dart';
import 'package:tu_cine_app/api_tucine/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource dataSource;
  ActorRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}