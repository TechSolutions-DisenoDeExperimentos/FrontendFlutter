import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/domain/entities/actor.dart';
import 'package:tu_cine_app/presentation/providers/actors/api_moviedb/actors_repository_rpovider.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier,Map<String, List<Actor>>> ((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(
    getActors: actorsRepository.getActorsByMovie,
  );
});



typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return; //

    //Aqui se hace la llamada a la api
    final List<Actor> actors = await getActors(movieId);

    //Aqui se guarda en el estado
    state = {...state, movieId: actors};

  }
}
