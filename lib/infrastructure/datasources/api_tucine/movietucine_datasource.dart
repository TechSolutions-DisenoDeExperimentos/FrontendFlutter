import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_tucine/movies_datasource.dart';
import 'package:tu_cine_app/domain/entities/cineclub.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/infrastructure/mappers/api_tucine/cineclub_mapper.dart';
import 'package:tu_cine_app/infrastructure/mappers/api_tucine/movie_mapper.dart';
import 'package:tu_cine_app/infrastructure/models/api_tucine/cineclub_response.dart';
import 'package:tu_cine_app/infrastructure/models/api_tucine/movie_response.dart';

class MovietucineDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.theTuCineBaseUrl,
  ));

  List<Movie> _jsonToMovies(List<dynamic> json) {
    final List<Movie> movies = json.map((data) {
      final movieResponse = MovieResponse.fromJson(data);
      return MovieMapper.movieToEntity(movieResponse);
    }).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await dio.get('/films');

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/films/$id');
    if (response.statusCode != 200) throw Exception('Error al obtener la pelicula');
    
    final movieDetails = MovieResponse.fromJson(response.data);

    final Movie movie = MovieMapper.movieToEntity(movieDetails);

    return movie;
  }

  List<Cineclub> _jsonToCineclubs(List<dynamic> json) {
    final List<Cineclub> cineclubs = json.map((data) {
      final cineclubResponse = CineclubResponse.fromJson(data);
      return CineclubMapper.cineclubToEntity(cineclubResponse);
    }).toList();

    return cineclubs;
  }

  @override
  Future<List<Cineclub>> getCineclubsById(String id) async {
    
    final response = await dio.get('/films/$id/businesses');

    return _jsonToCineclubs(response.data);
  }
}
