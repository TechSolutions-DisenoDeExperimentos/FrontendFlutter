import 'package:tu_cine_app/api_tucine/domain/entities/available_film.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';
import 'package:tu_cine_app/presentation/screens/tickets/ticket_widget.dart';
import 'package:flutter/material.dart';

class TiketView extends StatelessWidget {
  const TiketView(
      this.ticket, this.showtime, this.availableFilm, this.cineclub, this.movie,
      {super.key});
  // ignore: prefer_typing_uninitialized_variables
  final Ticket ticket;
  final Showtime showtime;
  final AvailableFilm availableFilm;
  final Cineclub cineclub;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Esto evita que aparezca la flecha de retroceso
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black87,
                  iconSize: 20,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const Text(
            "Ver Tiket",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
            ),
          ),
          TicketWidget(
              color: Colors.amberAccent,
              width: 300,
              height: 500,
              isCornerRounded: true,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 200,
                              height: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.network(
                                movie.posterSrc,
                                fit: BoxFit.cover,
                              )),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          const Text('Mostrar este ticket en la entrada.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              )),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(
                                thickness: 1,
                                height: 20,
                                color: Colors.black54,
                              )),
                          ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              title: const Text(
                                "Cineclub",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              subtitle: Text(
                                cineclub.name,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              trailing: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(30),
                                    child: Image.network(
                                      cineclub.logoSrc,
                                      fit: BoxFit.cover,
                                    ),
                                  ))),
                          Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ticketDetails('Fecha', showtime.playDate),
                                    ticketDetails('Horario', showtime.playDate)
                                  ]),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ticketDetails(
                                        'Dirección', cineclub.address),
                                    ticketDetails('Cantidad',
                                        (ticket.numberSeats).toString()),
                                  ]),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ticketDetails('Precio total',
                                        (ticket.totalPrice).toString()),
                                    ticketDetails(
                                        'Order Id', (ticket.id).toString())
                                  ]),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 200,
                            color: Colors.white,
                            child: Image.network(
                              "https://d100mj7v0l85u5.cloudfront.net/s3fs-public/2022-10/futuro-codigo-de-barras.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget ticketDetails(String title, String details) => Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          Text(
            details,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          )
        ],
      );
}
