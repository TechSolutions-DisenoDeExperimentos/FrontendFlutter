import 'package:tu_cine_app/domain/datasources/api_tucine/movies_datasource.dart';
import 'package:tu_cine_app/domain/entities/cineclub.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/domain/repositories/api_tucine/movies_repository.dart';

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
}