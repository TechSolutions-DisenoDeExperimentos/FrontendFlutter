import 'package:tu_cine_app/api_tucine/domain/datasources/tickets_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';

import 'package:tu_cine_app/api_tucine/domain/entities/ticket_post.dart';

import '../../domain/repositories/tickets_repository.dart';

class TicketRepositoryImpl extends TicketsRepository {
  final TicketsDatasource datasource;
  TicketRepositoryImpl(this.datasource);

  @override
  Future<TicketPost> createTicket(TicketPost ticket) {
    return datasource.createTicket(ticket);
  }

  @override
  Future<List<Ticket>> getAllTickets() {
    return datasource.getAllTickets();
  }

  @override
  Future<Ticket> getTicket(String ticketId) {
    return datasource.getTicket(ticketId);
  }

  @override
  Future<List<Ticket>> getTicketsByUserId(String userId) {
    return datasource.getTicketsByUserId(userId);
  }
}
