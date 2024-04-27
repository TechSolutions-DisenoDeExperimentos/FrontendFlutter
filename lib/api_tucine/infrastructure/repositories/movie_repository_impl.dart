import 'package:tu_cine_app/api_tucine/domain/datasources/movies_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/api_tucine/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource dataSource;
  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    return dataSource.getNowPlayingMovies();
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }

  @override
  Future<List<Cineclub>> getCineclubsById(String id) {
    return dataSource.getCineclubsById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return dataSource.searchMovies(query);
  }
}