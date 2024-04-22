import 'package:cine_app/api_tucine/domain/entities/ticket_post.dart';

abstract class TicketsDatasource{
/*   Future<List<Ticket>> getTickets(String userId);
  Future<Ticket> getTicket(String ticketId); */
  Future<TicketPost> createTicket(TicketPost ticket);
}