import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/infrastructure/datasources/api_tucine/actor_datasource.dart';
import 'package:tu_cine_app/infrastructure/repositories/api_tucine/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorAPITuCineDatasource());
});