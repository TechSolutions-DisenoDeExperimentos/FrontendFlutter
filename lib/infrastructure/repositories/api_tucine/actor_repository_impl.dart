import 'package:tu_cine_app/domain/datasources/api_tucine/actors_datasource.dart';
import 'package:tu_cine_app/domain/entities/actor.dart';
import 'package:tu_cine_app/domain/repositories/api_tucine/actors_repository.dart';


class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDataSource dataSource;
  ActorRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}