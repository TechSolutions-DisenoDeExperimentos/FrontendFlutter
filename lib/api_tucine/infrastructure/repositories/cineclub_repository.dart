import 'package:tu_cine_app/api_tucine/domain/datasources/cineclubs_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/repositories/cineclubs_repository.dart';

class CineclubRepositoryImpl extends CineclubsRepository{

  final CineclubsDatasource dataSource;
  CineclubRepositoryImpl(this.dataSource);

  @override
  Future<List<Cineclub>> getCineclubs() {
    return dataSource.getCineclubs();
  }
  
  @override
  Future<Cineclub> getCineclubById(String id) {
    return dataSource.getCineclubById(id);
  }
}