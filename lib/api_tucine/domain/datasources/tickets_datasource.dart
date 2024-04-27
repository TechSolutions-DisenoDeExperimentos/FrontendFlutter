import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket_post.dart';

abstract class TicketsDatasource{
/*   Future<List<Ticket>> getTickets(String userId);
  Future<Ticket> getTicket(String ticketId); */

  Future<List<Ticket>> getAllTickets();
  //editar cuando consigamos los tikets por id
  Future<List<Ticket>> getTicketsByUserId(String userId);

  Future<Ticket> getTicket(String ticketId);
  Future<TicketPost> createTicket(TicketPost ticket);
}