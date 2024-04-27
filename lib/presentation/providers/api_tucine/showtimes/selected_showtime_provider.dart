import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedShowtimeNotifier extends StateNotifier<Showtime?> {
  SelectedShowtimeNotifier() : super(null);

  void updateSelectedShowtime(Showtime showtime) {
    state = showtime;
  }
}

final selectedShowtimeProvider = StateNotifierProvider<SelectedShowtimeNotifier, Showtime?>((ref) {
  return SelectedShowtimeNotifier();
});

