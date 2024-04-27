
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/actor_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorAPITuCineDatasource());
});