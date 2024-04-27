import 'package:tu_cine_app/api_tucine/domain/entities/available_film.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/available_film_response.dart';
//import 'package:cine_app/api_tucine/infrastructure/models/showtime_response.dart';

class AvailableFilmMapper {
  static AvailableFilm availableFilmToEntity(AvailableFilmResponse availableFilmResponse) =>
      AvailableFilm(
        id: availableFilmResponse.id,
        cineclubId: availableFilmResponse.business.id,
        movieId: availableFilmResponse.film.id,
        customNotice: availableFilmResponse.customNotice,
        //isAvailable: availableFilmResponse.isAvailable
      );
}

