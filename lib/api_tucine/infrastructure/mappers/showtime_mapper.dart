import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/showtime_response.dart';

class ShowtimeMapper{
  static Showtime showtimeToEntity(ShowtimeResponse showtimeResponse) => 
  Showtime(
    id: showtimeResponse.id,
    playDate: showtimeResponse.playDate,
    playTime: showtimeResponse.playTime,
    capacity: showtimeResponse.capacity,
    unitPrice: showtimeResponse.unitPrice,
    availableFilmId: showtimeResponse.availableFilm.id
  );
}