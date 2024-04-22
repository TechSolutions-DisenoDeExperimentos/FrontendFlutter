import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/presentation/providers/booking/booking_quantity_provider.dart';
import 'package:tu_cine_app/presentation/providers/showtimes/selected_showtime_provider.dart';

final totalPriceProvider = Provider<double>((ref) {
  final selectedShowtime = ref.watch(selectedShowtimeProvider);
  final bookingQuantity = ref.watch(bookingQuantityProvider);

  double totalPrice = 0.0;

  if (selectedShowtime != null) {
    totalPrice = selectedShowtime.unitPrice * bookingQuantity;
  }

  return totalPrice;
});
