import 'package:tu_cine_app/api_moviedb/domain/entities/actor.dart';


abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
