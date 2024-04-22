import 'package:dio/dio.dart';
import 'package:tu_cine_app/config/constants/environment.dart';
import 'package:tu_cine_app/domain/datasources/api_tucine/tickets_datasource.dart';
import 'package:tu_cine_app/domain/entities/post_ticket.dart';

class TicketDatasource extends TicketsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.theTuCineBaseUrl,
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