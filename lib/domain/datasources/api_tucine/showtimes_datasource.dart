import 'package:tu_cine_app/domain/entities/showtime.dart';

abstract class ShowtimesDatasource{
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId);
}