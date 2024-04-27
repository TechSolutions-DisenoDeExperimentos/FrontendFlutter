import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/cineclubs/cineclub_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cineclubInfoProvider = StateNotifierProvider<CineclubMapNotifier,Map<String, Cineclub>> ((ref) {
  final getCineclub = ref.watch(cineclubRepositoryProvider);
  return CineclubMapNotifier(
    getCineclub: getCineclub.getCineclubById,
  );
});

typedef GetCineclubCallBack = Future<Cineclub> Function(String cineclubId);

class CineclubMapNotifier extends StateNotifier<Map<String, Cineclub>> {
  final GetCineclubCallBack getCineclub;

  CineclubMapNotifier({
    required this.getCineclub,
  }) : super({});

  Future<void> loadCineclub(String cineclubId) async {
    if (state[cineclubId] != null) return; //

    //Aqui se hace la llamada a la api
    final cineclub = await getCineclub(cineclubId);

    //Aqui se guarda en el estado
    state = {...state, cineclubId: cineclub};

  }

}