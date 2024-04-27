import 'package:tu_cine_app/api_tucine/domain/datasources/movies_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/cineclub_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/movie_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/movie_response.dart';
import 'package:dio/dio.dart';

class MovietucineDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
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
  
  @override
  Future<List<Movie>> searchMovies(String query) async{

    if ( query.isEmpty ) return [];

    final response = await dio.get('/films/search', 
      queryParameters: {
        'title': query
      }
    );

    return _jsonToMovies(response.data);

  }
}
