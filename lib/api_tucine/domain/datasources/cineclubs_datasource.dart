import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';

abstract class CineclubsDatasource{
  Future<List<Cineclub>> getCineclubs();
  Future<Cineclub> getCineclubById(String id);
}