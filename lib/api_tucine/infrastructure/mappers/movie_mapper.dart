import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/movie_response.dart';

class MovieMapper {
  static Movie movieToEntity(MovieResponse movieResponse) => Movie (
    id: movieResponse.id,
    title: movieResponse.title,
    year: movieResponse.year,
    synopsis: movieResponse.synopsis,
    posterSrc: movieResponse.posterSrc,
    genreIds: movieResponse.categories.map((e) => e.name).toList(),
    trailerSrc: movieResponse.trailerSrc,
    duration: movieResponse.duration
  );
}