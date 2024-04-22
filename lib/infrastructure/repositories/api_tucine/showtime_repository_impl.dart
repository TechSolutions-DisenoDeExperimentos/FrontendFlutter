import 'package:tu_cine_app/domain/datasources/api_tucine/showtimes_datasource.dart';
import 'package:tu_cine_app/domain/entities/showtime.dart';
import 'package:tu_cine_app/domain/repositories/api_tucine/showtimes_repository.dart';

class ShowtimeRepositoryImpl extends ShowtimesRepository {
  final ShowtimesDatasource dataSource;
  ShowtimeRepositoryImpl(this.dataSource);

  @override
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId) {
    return dataSource.getShowtimes(movieId, cineclubId);
  }
}