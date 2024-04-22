import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/infrastructure/models/api_moviedb/movie_moviedb.dart';
import 'package:tu_cine_app/infrastructure/models/api_moviedb/movie_details.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie( //yo espero :T
        id: moviedb.id,
        title: moviedb.title,
        year: 0,
        synopsis: moviedb.overview,
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        posterSrc: (moviedb.posterPath != '')
            ? '${Environment.theMovieDbImagesUrl}/${moviedb.posterPath}'
            : 'noposter',
        //releaseDate: moviedb.releaseDate,
        trailerSrc: '',
        duration: 0,
      );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
        id: movie.id,
        title: movie.title,
        year: 0,
        synopsis: movie.overview,
        genreIds: movie.genres.map((e) => e.name).toList(),
        posterSrc: (movie.posterPath != '')
            ? '${Environment.theMovieDbImagesUrl}/${movie.posterPath}'
            : 'noposter',
        //releaseDate: movie.releaseDate,
        trailerSrc: '',
        duration: 0,
      );
}