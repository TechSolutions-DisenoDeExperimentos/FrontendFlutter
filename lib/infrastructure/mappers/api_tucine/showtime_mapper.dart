import 'package:tu_cine_app/infrastructure/models/api_tucine/showtime_response.dart';

import '../../../domain/entities/showtime.dart';

class ShowtimeMapper{
  static Showtime showtimeToEntity(ShowtimeResponse showtimeResponse) => 
  Showtime(
    id: showtimeResponse.id,
    playDate: showtimeResponse.playDate,
    playTime: showtimeResponse.playTime,
    capacity: showtimeResponse.capacity,
    unitPrice: showtimeResponse.unitPrice,
  );
}