import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';

abstract class ShowtimesRepository{
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId);
  Future<Showtime> getShowtimeById(String id);
}