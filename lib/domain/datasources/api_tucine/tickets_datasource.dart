import 'package:tu_cine_app/domain/entities/post_ticket.dart';

abstract class TicketsDatasource{
/*   Future<List<Ticket>> getTickets(String userId);
  Future<Ticket> getTicket(String ticketId); */
  Future<TicketPost> createTicket(TicketPost ticket);
}