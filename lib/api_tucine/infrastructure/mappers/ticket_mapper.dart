import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/ticket_response.dart';

class TicketMapper {
  static Ticket ticketToEntity(TicketResponse ticketResponse) => Ticket(
    id: ticketResponse.id,
    numberSeats: ticketResponse.numberSeats,
    totalPrice: ticketResponse.totalPrice,
    status: ticketResponse.status,
    dateEmition: ticketResponse.dateEmition,
    //user: ticketResponse.user,
    //showtime: ticketResponse.showtime
    userId: ticketResponse.user.id,
    showtimeId: ticketResponse.showtime.id,
    //availableFilmId: ticketResponse.showtime.id
  );
}
