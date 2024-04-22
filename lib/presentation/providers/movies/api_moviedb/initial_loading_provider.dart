import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/presentation/providers/movies/api_moviedb/movies_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final upcomingMovies = ref.watch(upcomingMoviesProvider).isEmpty;

  if (nowPlayingMovies || upcomingMovies) return true;

  return false;
  
});