
import 'package:tu_cine_app/api_moviedb/domain/datasources/movies_datasource.dart';
import 'package:tu_cine_app/api_moviedb/domain/entities/movie.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/mappers/movie_mapper.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/models/moviedb/movie_details.dart';
import 'package:tu_cine_app/api_moviedb/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': 'c4516ab1ea92e264566821c3850a2e3f',
        'language': 'es-ES',
      },
    )
  );

  List<Movie> _jsonToMovies( Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);
    
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster-path')
    .map(
      (moviedb) => MovieMapper.movieDbToEntity(moviedb)
    ).toList();   

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'page': page,
      },
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {
        'page': page,
      },
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'page': page,
      },
    );

    return _jsonToMovies(response.data);    
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
     
     final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {
        'page': page,
      },
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if ( response.statusCode != 200) throw Exception('Error getting movie by id: $id not found');
    
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }



}