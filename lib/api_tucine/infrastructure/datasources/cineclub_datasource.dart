
import 'package:tu_cine_app/api_tucine/domain/datasources/cineclubs_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/cineclub_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';
import 'package:dio/dio.dart';

class CineclubDatasource extends CineclubsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

  List<Cineclub> _jsonToCineclubs(List<dynamic> json) {
    final List<Cineclub> cineclubs = json.map((data) {
      final cineclubResponse = CineclubResponse.fromJson(data);
      return CineclubMapper.cineclubToEntity(cineclubResponse);
    }).toList();

    return cineclubs;
  }

  @override
  Future<List<Cineclub>> getCineclubs() async {
    final response = await dio.get('/businesses');

    return _jsonToCineclubs(response.data);
  }
  
  @override
  Future<Cineclub> getCineclubById(String id) async {
    final response = await dio.get('/businesses/$id');
    if (response.statusCode != 200) throw Exception('Error al obtener el cineclub');

    final cineclubDetails = CineclubResponse.fromJson(response.data);

    final Cineclub cineclub = CineclubMapper.cineclubToEntity(cineclubDetails);

    return cineclub;
  }
}
