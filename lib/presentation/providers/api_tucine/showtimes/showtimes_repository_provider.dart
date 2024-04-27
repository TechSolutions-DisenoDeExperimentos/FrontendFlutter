import 'package:tu_cine_app/api_tucine/infrastructure/datasources/showtime_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/repositories/showtime_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showtimeRepositoryProvider = Provider((ref) {
  return ShowtimeRepositoryImpl(ShowtimeDatasource());
});