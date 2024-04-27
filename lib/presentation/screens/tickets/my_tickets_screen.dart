import 'package:tu_cine_app/api_tucine/domain/entities/available_film.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/available_film_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/cineclub_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/movietucine_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/showtime_datasource.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/datasources/ticket_datasource.dart';
import 'package:tu_cine_app/presentation/screens/tickets/ticket_view.dart';
import 'package:flutter/material.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  final List<String> states = ['Pasado', 'Activo', 'Cancelado'];
  List<String> selectedStates = [];

  final TicketDatasource ticketDatasource = TicketDatasource();
  final ShowtimeDatasource showtimeDatasource = ShowtimeDatasource();
  final MovietucineDatasource movietucineDatasource = MovietucineDatasource();
  final AvailableFilmDatasource availableFilmDatasource =
      AvailableFilmDatasource();
  final CineclubDatasource cineclubDatasource = CineclubDatasource();

  List<Movie> allMovies = [];
  List<Ticket> allTicketsByUserId = [];
  List<AvailableFilm> allAvailableFilms = [];
  List<Cineclub> allCineclubs = [];
  List<Showtime> allShowtimes = [];

  @override
  void initState() {
    super.initState();
    _loadTickets();
  }

  Future<void> _loadTickets() async {
    try {
      // Llamar al método para obtener todos los tickets
      List<Ticket> fetchedTickets =
          await ticketDatasource.getTicketsByUserId('1');
      List<AvailableFilm> availableFilms =
          await availableFilmDatasource.getAllAvailableFilms();
      List<Movie> fetchedMovies =
          await movietucineDatasource.getNowPlayingMovies();
      List<Cineclub> fetchedCineclubs = await cineclubDatasource.getCineclubs();
      List<Showtime> fetchedShowtimes =
          await showtimeDatasource.getAllShowtimes();
      setState(() {
        allTicketsByUserId = fetchedTickets;
        allAvailableFilms = availableFilms;
        allMovies = fetchedMovies;
        allCineclubs = fetchedCineclubs;
        allShowtimes = fetchedShowtimes;
      });
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir al cargar los tickets
      print('Error cargando los tickets: $e');
    }
  }

  AvailableFilm getAvFilmByIdS(int id) {
    AvailableFilm thisAvFilm =
        allAvailableFilms.firstWhere((avFilm) => avFilm.id == id);

    return thisAvFilm;
  }

  Movie getMovieById(int id) {
    Movie thisMovie = allMovies.firstWhere((element) => element.id == id);
    return thisMovie;
  }

  Cineclub getCineclubById(int id) {
    Cineclub thisCineclub =
        allCineclubs.firstWhere((element) => element.id == id);
    return thisCineclub;
  }

  Showtime getShowtimeById(int id) {
    Showtime thisShowtime =
        allShowtimes.firstWhere((element) => element.id == id);
    return thisShowtime;
  }

  @override
  Widget build(BuildContext context) {
    final filterMovies = allTicketsByUserId.where((movieTicket) {
      return selectedStates.isEmpty ||
          selectedStates.contains(movieTicket.status);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Tickets'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: states
                    .map((state) => FilterChip(
                        label: Text(state),
                        selected: selectedStates.contains(state),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedStates.add(state);
                            } else {
                              selectedStates.remove(state);
                            }
                          });
                        }))
                    .toList()),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: allTicketsByUserId.length,
                  itemBuilder: (context, i) {
                    if (i >= 0 &&
                        i < allTicketsByUserId.length &&
                        i < filterMovies.length) {
                      final movieTicket = filterMovies[i];
                      return Card(
                          elevation: 8.0,
                          margin: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    title: Text(
                                        getMovieById((getAvFilmByIdS((getShowtimeById(movieTicket.showtimeId)).availableFilmId)).movieId).title,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(movieTicket.status,
                                        style: const TextStyle(
                                            color: Colors.black12,
                                            fontWeight: FontWeight.bold)),
                                    trailing: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(30),
                                          child: Image.network(getMovieById(getAvFilmByIdS((getShowtimeById(movieTicket.showtimeId)).availableFilmId).movieId).posterSrc,
                                              fit: BoxFit.cover),
                                        )),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  TiketView(
                                                      movieTicket, getShowtimeById(movieTicket.showtimeId), getAvFilmByIdS((getShowtimeById(movieTicket.showtimeId)).availableFilmId), getCineclubById((getAvFilmByIdS((getShowtimeById(movieTicket.showtimeId)).availableFilmId)).cineclubId),
                                                      getMovieById((getAvFilmByIdS((getShowtimeById(movieTicket.showtimeId)).availableFilmId)).movieId)))
                                                      );
                                    },
                                  )
                                ],
                              )));
                    }
                    return null;
                  }))
        ],
      ),
    );
  }
}
