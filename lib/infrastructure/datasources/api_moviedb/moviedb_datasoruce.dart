import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_moviedb/movies_datasource.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/infrastructure/mappers/api_moviedb/movie_mapper.dart';
import 'package:tu_cine_app/infrastructure/models/api_moviedb/movie_details.dart';
import 'package:tu_cine_app/infrastructure/models/api_moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  //Obtener las peliculas en cartelera
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {

    //Se crea una instancia de la clase MovieDbResponse
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlayingFilms({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopularFilms({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcomingFilms({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRatedFilms({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Error al obtener la pelicula');

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }
}
