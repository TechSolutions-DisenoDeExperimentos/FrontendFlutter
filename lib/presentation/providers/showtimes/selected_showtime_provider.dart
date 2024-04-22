import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/domain/entities/showtime.dart';

class SelectedShowtimeNotifier extends StateNotifier<Showtime?> {
  SelectedShowtimeNotifier() : super(null);

  void updateSelectedShowtime(Showtime showtime) {
    state = showtime;
  }
}

final selectedShowtimeProvider = StateNotifierProvider<SelectedShowtimeNotifier, Showtime?>((ref) {
  return SelectedShowtimeNotifier();
});

