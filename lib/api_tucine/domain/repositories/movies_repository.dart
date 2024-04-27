import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayingMovies();
  Future<Movie> getMovieById(String id);
  Future<List<Cineclub>> getCineclubsById(String id);
  Future<List<Movie>> searchMovies( String query );
}