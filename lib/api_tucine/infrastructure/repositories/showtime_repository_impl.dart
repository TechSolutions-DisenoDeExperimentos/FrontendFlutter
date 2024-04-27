import 'package:tu_cine_app/api_tucine/domain/datasources/showtimes_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/api_tucine/domain/repositories/showtimes_repository.dart';

class ShowtimeRepositoryImpl extends ShowtimesRepository {
  final ShowtimesDatasource dataSource;
  ShowtimeRepositoryImpl(this.dataSource);

  @override
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId) {
    return dataSource.getShowtimes(movieId, cineclubId);
  }
  
  @override
  Future<Showtime> getShowtimeById(String id) {
    return dataSource.getShowtimeById(id);
  }
}