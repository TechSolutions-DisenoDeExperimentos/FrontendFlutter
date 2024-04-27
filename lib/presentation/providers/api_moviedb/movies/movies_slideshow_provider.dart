import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/api_moviedb/domain/entities/movie.dart';

import 'package:tu_cine_app/presentation/providers/providers.dart';


final moviesSlideshowProvider = Provider<List<Movie>>((ref){
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0, 10);
});