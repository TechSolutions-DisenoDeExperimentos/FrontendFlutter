import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_tucine/showtimes_datasource.dart';
import 'package:tu_cine_app/domain/entities/showtime.dart';
import 'package:tu_cine_app/infrastructure/mappers/api_tucine/showtime_mapper.dart';
import 'package:tu_cine_app/infrastructure/models/api_tucine/showtime_response.dart';

class ShowtimeDatasource extends ShowtimesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.theTuCineBaseUrl,
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