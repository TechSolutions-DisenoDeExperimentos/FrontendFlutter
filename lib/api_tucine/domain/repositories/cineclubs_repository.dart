import 'package:cine_app/api_tucine/domain/entities/cineclub.dart';

abstract class CineclubsRepository{
  Future<List<Cineclub>> getCineclubs();
  Future<Cineclub> getCineclubById(String id);
}