//Now playing provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/presentation/providers/movies/api_moviedb/movies_repository_provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlayingFilms;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

//Popular movies provider
final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopularFilms;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

//Upcoming movies provider
final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcomingFilms;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

//Top rated movies provider
final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRatedFilms;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if(isLoading) return;
    isLoading = true;

    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
