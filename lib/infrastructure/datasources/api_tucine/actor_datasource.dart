import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_tucine/actors_datasource.dart';
import 'package:tu_cine_app/domain/entities/actor.dart';
import 'package:tu_cine_app/infrastructure/mappers/api_tucine/actor_mapper.dart';
import 'package:tu_cine_app/infrastructure/models/api_tucine/actors_response.dart';

class ActorAPITuCineDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.theTuCineBaseUrl,
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