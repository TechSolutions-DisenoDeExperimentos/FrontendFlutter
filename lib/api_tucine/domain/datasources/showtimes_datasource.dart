import 'package:cine_app/api_tucine/domain/entities/showtime.dart';

abstract class ShowtimesDatasource{
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId);
}