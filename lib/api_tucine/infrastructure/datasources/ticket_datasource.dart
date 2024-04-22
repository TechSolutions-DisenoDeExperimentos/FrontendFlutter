import 'package:cine_app/api_tucine/domain/datasources/tickets_datasource.dart';
import 'package:cine_app/api_tucine/domain/entities/ticket_post.dart';
import 'package:dio/dio.dart';

class TicketDatasource extends TicketsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://deploybackendtucine-production.up.railway.app/api/TuCine/v1',
  ));

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
}
