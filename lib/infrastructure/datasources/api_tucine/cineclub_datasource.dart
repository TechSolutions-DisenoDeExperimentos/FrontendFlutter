import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_tucine/cineclubs_datasource.dart';
import 'package:tu_cine_app/domain/entities/cineclub.dart';
import 'package:tu_cine_app/infrastructure/mappers/api_tucine/cineclub_mapper.dart';
import 'package:tu_cine_app/infrastructure/models/api_tucine/cineclub_response.dart';

class CineclubDatasource extends CineclubsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.theTuCineBaseUrl,
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
