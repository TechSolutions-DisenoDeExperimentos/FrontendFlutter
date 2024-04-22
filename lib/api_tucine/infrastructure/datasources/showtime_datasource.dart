import 'package:cine_app/api_tucine/domain/datasources/showtimes_datasource.dart';
import 'package:cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:cine_app/api_tucine/infrastructure/mappers/showtime_mapper.dart';
import 'package:cine_app/api_tucine/infrastructure/models/showtime_response.dart';
import 'package:dio/dio.dart';

class ShowtimeDatasource extends ShowtimesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

  List<Showtime> _jsonToShowtimes(List<dynamic> json) {
    final List<Showtime> showtimes = json.map((data) {
      final showtimeResponse = ShowtimeResponse.fromJson(data);
      return ShowtimeMapper.showtimeToEntity(showtimeResponse);
    }).toList();

    return showtimes;
  }

  @override
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId) async {
    final response = await dio.get('/showtimes/$movieId/$cineclubId');

    return _jsonToShowtimes(response.data);
  }
}