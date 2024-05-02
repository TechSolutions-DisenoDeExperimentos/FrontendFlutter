
import 'package:tu_cine_app/api_moviedb/domain/datasources/actors_datasource.dart';
import 'package:tu_cine_app/api_moviedb/domain/entities/actor.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/mappers/actor_mapper.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': 'c4516ab1ea92e264566821c3850a2e3f',
      'language': 'es-ES',
    },
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {

    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
  }

}