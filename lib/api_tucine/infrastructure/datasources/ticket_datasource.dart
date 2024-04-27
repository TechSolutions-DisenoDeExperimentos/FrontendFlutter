//import 'package:cine_app/api_moviedb/infrastructure/models/moviedb/credits_response.dart';
import 'package:tu_cine_app/api_tucine/domain/datasources/tickets_datasource.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket_post.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/mappers/ticket_mapper.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/ticket_response.dart';
import 'package:dio/dio.dart';

class TicketDatasource extends TicketsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl:
        'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

  List<Ticket> _jsonToTickets(List<dynamic> json) {
    final List<Ticket> tickets = json.map((data) {
      final ticketResponse = TicketResponse.fromJson(data);
      return TicketMapper.ticketToEntity(ticketResponse);
    }).toList();
    return tickets;
  }

  @override
  Future<TicketPost> createTicket(TicketPost ticket) async {
    try {
      final response = await dio.post('/tickets', data: ticket.toJson());

      if (response.statusCode == 201) {
        return TicketPost.fromJson(response.data);
      } else {
        throw Exception('Failed to create ticket');
      }
    } catch (e) {
      throw Exception('Error creating ticket: $e');
    }
  }

  @override
  Future<Ticket> getTicket(String ticketId) async {
    final response = await dio.get('/tickets/$ticketId');
    if (response.statusCode != 200) {
      throw Exception('Error al obtener el ticket');
    }

    final ticketResponse = TicketResponse.fromJson(response.data);
    final Ticket ticket = TicketMapper.ticketToEntity(ticketResponse);

    return ticket;
  }

  @override
  Future<List<Ticket>> getTicketsByUserId(String userId) async {
    final response = await dio.get('/tickets/userid/$userId');
    return _jsonToTickets(response.data);
  }

  @override
  Future<List<Ticket>> getAllTickets() async {
    final response = await dio.get('/tickets');
    return _jsonToTickets(response.data);
  }
}
