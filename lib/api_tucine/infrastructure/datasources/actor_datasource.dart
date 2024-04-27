import 'package:tu_cine_app/api_tucine/domain/datasources/actors_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/actor.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/actor_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/actors_response.dart';
import 'package:dio/dio.dart';

class ActorAPITuCineDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

  List<Actor> _jsonToActors(List<dynamic> json) {
    final List<Actor> actors = json.map((data) {
      final actorResponse = ActorsResponse.fromJson(data);
      return ActorMapper.castToEntity(actorResponse);
    }).toList();

    return actors;
  }


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/films/$movieId/actors');

    return _jsonToActors(response.data);
  }
}