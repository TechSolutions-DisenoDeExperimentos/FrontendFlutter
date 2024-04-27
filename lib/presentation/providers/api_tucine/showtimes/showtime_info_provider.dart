import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/showtimes/showtimes_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showtimeInfoProvider = StateNotifierProvider<ShowtimeMapNotifier,Map<String, Showtime>> ((ref) {
  final getMovie = ref.watch(showtimeRepositoryProvider);
  return ShowtimeMapNotifier(
    getShowtime: getMovie.getShowtimeById,
  );
});


typedef GetShowtimeCallBack = Future<Showtime> Function(String showtimeId);

class ShowtimeMapNotifier extends StateNotifier<Map<String, Showtime>> {
  final GetShowtimeCallBack getShowtime;

  ShowtimeMapNotifier({
    required this.getShowtime,
  }) : super({});

  Future<void> loadShowtime(String showtimeId) async {
    if (state[showtimeId] != null) return; //

    //Aqui se hace la llamada a la api
    final showtime = await getShowtime(showtimeId);

    //Aqui se guarda en el estado
    state = {...state, showtimeId: showtime};

  }
}