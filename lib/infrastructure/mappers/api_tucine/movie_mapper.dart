import 'package:tu_cine_app/infrastructure/models/api_tucine/movie_response.dart';

import '../../../domain/entities/movie.dart';

class MovieMapper {
  static Movie movieToEntity(MovieResponse movieResponse) => Movie (
    id: movieResponse.id,
    title: movieResponse.title,
    year: movieResponse.year,
    synopsis: movieResponse.synopsis,
    posterPath: movieResponse.posterSrc,
    genreIds: movieResponse.categories.map((e) => e.name).toList(),
  );
}