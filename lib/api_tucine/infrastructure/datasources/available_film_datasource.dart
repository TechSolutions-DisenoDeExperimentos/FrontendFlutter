import 'package:tu_cine_app/api_tucine/domain/datasources/available_films_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/available_film.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/available_film_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/available_film_response.dart';
import 'package:dio/dio.dart';

class AvailableFilmDatasource extends AvailableFilmsDatasource{

  final dio = Dio(BaseOptions(
    baseUrl:
        'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

  List<AvailableFilm> _jsonToAvailableFilms(List<dynamic> json) {
    final List<AvailableFilm> tickets = json.map((data) {
      final availableFilmResponse = AvailableFilmResponse.fromJson(data);
      return AvailableFilmMapper.availableFilmToEntity(availableFilmResponse);
    }).toList();
    return tickets;
  }

  @override
  Future getAvailableFilmsById(String avFilmId) async {
    final response = await dio.get('/availableFilms/$avFilmId');
    if (response.statusCode != 200) {
      throw Exception('Error al obtener el avFilm');
    }

    final availableFilmResponse = AvailableFilmResponse.fromJson(response.data);
    final AvailableFilm availableFilm = AvailableFilmMapper.availableFilmToEntity(availableFilmResponse);

    return availableFilm;
  }
  
  @override
  Future getAllAvailableFilms() async {
    final response = await dio.get('/availableFilms');
    return _jsonToAvailableFilms(response.data);
  }

}