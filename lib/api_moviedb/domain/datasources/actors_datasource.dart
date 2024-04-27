import 'package:tu_cine_app/api_moviedb/domain/entities/actor.dart';

abstract class ActorsDatasource {
  
  Future<List<Actor>> getActorsByMovie(String movieId);

}