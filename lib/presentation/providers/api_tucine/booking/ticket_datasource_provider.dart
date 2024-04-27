import 'package:tu_cine_app/api_tucine/infrastructure/datasources/ticket_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ticketDatasourceProvider = Provider<TicketDatasource>((ref) {
  return TicketDatasource();
});
