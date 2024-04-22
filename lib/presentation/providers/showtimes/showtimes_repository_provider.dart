import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/infrastructure/datasources/api_tucine/showtime_datasource.dart';
import 'package:tu_cine_app/infrastructure/repositories/api_tucine/showtime_repository_impl.dart';

final showtimeRepositoryProvider = Provider((ref) {
  return ShowtimeRepositoryImpl(ShowtimeDatasource());
});