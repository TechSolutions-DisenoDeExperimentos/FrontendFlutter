import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/entities/movie.dart';
import 'package:tu_cine_app/infrastructure/models/api_moviedb/movie_moviedb.dart';
import 'package:tu_cine_app/infrastructure/models/api_moviedb/movie_details.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie( //yo espero :T
        id: moviedb.id,
        title: moviedb.title,
        year: moviedb.releaseDate.year,
        synopsis: moviedb.overview,
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        posterPath: (moviedb.posterPath != '')
            ? '${Environment.theMovieDbImagesUrl}/${moviedb.posterPath}'
            : 'https://www.reelviews.net/resources/img/default_poster.jpg',
      );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
        id: movie.id,
        title: movie.title,
        year: movie.releaseDate.year,
        synopsis: movie.overview,
        genreIds: movie.genres.map((e) => e.name).toList(),
        posterPath: (movie.posterPath != '')
            ? '${Environment.theMovieDbImagesUrl}/${movie.posterPath}'
            : 'https://www.reelviews.net/resources/img/default_poster.jpg',
      );
}