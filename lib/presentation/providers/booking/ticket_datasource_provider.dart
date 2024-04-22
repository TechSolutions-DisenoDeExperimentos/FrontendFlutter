import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/infrastructure/datasources/api_tucine/ticket_datasource.dart';

final ticketDatasourceProvider = Provider<TicketDatasource>((ref) {
  return TicketDatasource();
});