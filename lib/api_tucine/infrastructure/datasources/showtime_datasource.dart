import 'package:tu_cine_app/api_tucine/domain/datasources/showtimes_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/showtime_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/showtime_response.dart';
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
  
  @override
  Future<Showtime> getShowtimeById(String id) async {
    final response = await dio.get('/showtimes/$id');
    if (response.statusCode != 200) throw Exception('Error al obtener el showtime');
    
    final showtimeDetails = ShowtimeResponse.fromJson(response.data);

    final Showtime showtime = ShowtimeMapper.showtimeToEntity(showtimeDetails);

    return showtime;
  }
  
  @override
  Future<List<Showtime>> getAllShowtimes() async {
    final response = await dio.get('/showtimes');
    return _jsonToShowtimes(response.data);
  }
}