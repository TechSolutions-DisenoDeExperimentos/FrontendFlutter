import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket_post.dart';

abstract class TicketsRepository {
  Future<List<Ticket>> getAllTickets();
  Future<List<Ticket>> getTicketsByUserId(String userId);

  Future<Ticket> getTicket(String ticketId);
  Future<TicketPost> createTicket(TicketPost ticket);
}
