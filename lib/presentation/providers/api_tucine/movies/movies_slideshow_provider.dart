import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref){
  final nowPlayingMovies = ref.watch(moviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0, 3);
});