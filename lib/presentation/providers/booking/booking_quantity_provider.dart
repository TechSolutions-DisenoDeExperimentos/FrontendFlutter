import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingQuantityStateNotifier extends StateNotifier<int> {
  BookingQuantityStateNotifier() : super(1);

  void incrementTickets() {
    if (state < 10) {
      state++;
    }
  }

  void decrementTickets() {
    if (state > 1) {
      state--;
    }
  }
}

final bookingQuantityProvider = StateNotifierProvider<BookingQuantityStateNotifier, int>((ref) {
  return BookingQuantityStateNotifier();
});
