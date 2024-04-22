import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/presentation/providers/movies/api_tucine/movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  
  //final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  final nowPlayingMovies = ref.watch(moviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 5);
});