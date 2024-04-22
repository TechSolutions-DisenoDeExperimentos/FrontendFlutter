import 'package:tu_cine_app/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlayingFilms({int page = 1});

  //Obtener las peliculas populares
  Future<List<Movie>> getPopularFilms({int page = 1});

    //Obtener las proximas peliculas
  Future<List<Movie>> getUpcomingFilms({int page = 1});

  //Obtener las mejor calificadas peliculas
  Future<List<Movie>> getTopRatedFilms({int page = 1});

  Future<Movie> getMovieById(String id);
}