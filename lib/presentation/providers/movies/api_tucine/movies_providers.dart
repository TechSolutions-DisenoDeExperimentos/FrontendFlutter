import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/presentation/providers/movies/api_tucine/movies_repository_provider.dart';

final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlayingMovies;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

typedef MovieCallback = Future<List<Movie>> Function();

class MoviesNotifier extends StateNotifier<List<Movie>> {

  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> getNowPlayingMovies() async {
    final movies = await fetchMoreMovies();
    state = [...state, ...movies];
  }
}