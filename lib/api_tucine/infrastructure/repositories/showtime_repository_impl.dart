import 'package:cine_app/api_tucine/domain/datasources/showtimes_datasource.dart';
import 'package:cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:cine_app/api_tucine/domain/repositories/showtimes_repository.dart';

class ShowtimeRepositoryImpl extends ShowtimesRepository {
  final ShowtimesDatasource dataSource;
  ShowtimeRepositoryImpl(this.dataSource);

  @override
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId) {
    return dataSource.getShowtimes(movieId, cineclubId);
  }
}