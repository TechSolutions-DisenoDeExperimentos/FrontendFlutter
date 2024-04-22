import 'package:tu_cine_app/domain/datasources/api_tucine/cineclubs_datasource.dart';
import 'package:tu_cine_app/domain/entities/cineclub.dart';
import 'package:tu_cine_app/domain/repositories/api_tucine/cineclubs_repository.dart';

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