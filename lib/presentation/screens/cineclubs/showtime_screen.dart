import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/movie.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/showtime.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/ticket_post.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/movies/movie_info_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/booking/booking_quantity_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/booking/ticket_datasource_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/booking/total_price_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/cineclubs/cineclub_info_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/showtimes/selected_showtime_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/showtimes/showtime_by_movie_cineclub_provider.dart';

class ShowtimeScreen extends ConsumerStatefulWidget {
  static const routeName = 'showtime_screen';

  final String movieId;
  final String cineclubId;

  const ShowtimeScreen({
    super.key,
    required this.movieId,
    required this.cineclubId,
  });

  @override
  ShowtimeScreenState createState() => ShowtimeScreenState();
}

class ShowtimeScreenState extends ConsumerState<ShowtimeScreen> {

  @override
  void initState() {
    super.initState();

    //Aqui se llama al provider
    ref
        .read(showtimesByMovieCineclubProvider.notifier)
        .loadShowtimes(widget.movieId, widget.cineclubId);
    ref.read(cineclubInfoProvider.notifier).loadCineclub(widget.cineclubId);
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final cineclub = ref.watch(cineclubInfoProvider)[widget.cineclubId];
    final movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (cineclub == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (movie == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: ShowtimeAppBar(),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                _MovieDetails(movie: movie),
                const SizedBox(height: 10),
                _CineclubDetails(cineclub: cineclub),
                const SizedBox(height: 10),
                _ShowtimeList(
                    movieId: movie.id.toString(),
                    cineclubId: cineclub.id.toString()),
                const SizedBox(height: 10),
                const _BookingQuantity(),
                const SizedBox(height: 10),
                const _TotalPrice(),
                const SizedBox(height: 10),
                const _Book(),
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}

class _Book extends ConsumerStatefulWidget {
  const _Book();

  @override
  _BookState createState() => _BookState();
}

class _BookState extends ConsumerState<_Book> {
  @override
  Widget build(BuildContext context) {
    final selectedShowtime = ref.watch(selectedShowtimeProvider);
    final bookingQuantity = ref.watch(bookingQuantityProvider);

    return Container(
      padding: const EdgeInsets.all(0),
      child: FilledButton.tonal(
        onPressed: () async {
          final ticket = TicketPost(
            numberSeats: bookingQuantity,
            totalPrice: selectedShowtime!.unitPrice * bookingQuantity,
            userId: 1, // Asigna el userId como 1
            showtimeId: selectedShowtime.id,
          );

          final ticketDatasource = ref.read(ticketDatasourceProvider);
          await ticketDatasource.createTicket(ticket);
        },
        child: const Text(
          'Reservar',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}

class _TotalPrice extends ConsumerStatefulWidget {
  const _TotalPrice();

  @override
  _TotalPriceState createState() => _TotalPriceState();
}

class _TotalPriceState extends ConsumerState<_TotalPrice> {
  @override
  Widget build(BuildContext context) {
    final totalPrice = ref.watch(totalPriceProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          Text(
            'S/ ${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingQuantity extends ConsumerStatefulWidget {
  const _BookingQuantity();

  @override
  _BookingQuantityState createState() => _BookingQuantityState();
}

class _BookingQuantityState extends ConsumerState<_BookingQuantity> {
  @override
  Widget build(BuildContext context) {
    final numberOfTickets = ref.watch(bookingQuantityProvider.notifier); // Accede al StateNotifier

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cantidad de entradas',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F5F5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer(builder: (context, watch, _) {
                        final numberOfTicketsValue = ref.watch(bookingQuantityProvider);

                        return Text(
                          numberOfTicketsValue.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => numberOfTickets.decrementTickets(),
                            icon: const Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: () => numberOfTickets.incrementTickets(),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShowtimeList extends ConsumerStatefulWidget {
  final String movieId;
  final String cineclubId;

  const _ShowtimeList({
    required this.movieId,
    required this.cineclubId,
  });

  @override
  _ShowtimeListState createState() => _ShowtimeListState();
}

class _ShowtimeListState extends ConsumerState<_ShowtimeList> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final showtimesMap = ref.watch(showtimesByMovieCineclubProvider);
    final List<Showtime>? showtimes = showtimesMap['${widget.movieId}${widget.cineclubId}'];

    if (showtimes == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Horarios',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: showtimes.length,
            itemBuilder: (context, index) {
              final showtime = showtimes[index];

              return GestureDetector(
                onTap: () {
                  ref.read(selectedShowtimeProvider.notifier).updateSelectedShowtime(showtime);
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    _ShowtimeCard(
                      showtime: showtime,
                      isSelected: index == _selectedIndex,
                      onTap: () {
                        ref.read(selectedShowtimeProvider.notifier).updateSelectedShowtime(showtime);
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ShowtimeCard extends StatelessWidget {
  final Showtime showtime;
  final bool isSelected;
  final VoidCallback onTap;

  const _ShowtimeCard({
    required this.showtime,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(showtime.playDate);
    String formattedDate = DateFormat('dd MMM').format(parsedDate);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: isSelected ? const Color(0xFFF19F35) : const Color(0xFFF8F5F5), // Cambiamos el color del Card
        child: Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                formattedDate,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                showtime.playTime,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'S/ ${showtime.unitPrice.toString()}',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Película',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7C2), // Color de fondo
                    borderRadius: BorderRadius.circular(
                        10), // Ajusta el radio de borde según lo necesites
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movie.posterSrc,
                          width: 40,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const SizedBox();
                            }
                            return FadeIn(child: child);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              movie.title,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              movie.genreIds
                                  .join(', '), // Une los géneros con ', '
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class _CineclubDetails extends StatelessWidget {
  final Cineclub cineclub;

  const _CineclubDetails({required this.cineclub});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cineclub.name,
                        style: titleStyle.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(Icons.location_pin,
                              color: Colors.black, size: 15),
                          const SizedBox(width: 3),
                          Text(
                            cineclub.address,
                            style: titleStyle.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FilledButton.tonal(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffFE0000)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Ver más',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ]),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cineclub.bannerSrc,
                  width: size.width * 0.95,
                  height: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) return const SizedBox();
                    return FadeIn(child: child);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowtimeAppBar extends StatelessWidget {
  const ShowtimeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              //width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Image.asset('assets/logo.png' , width: 30, height: 30),
                  const SizedBox(width: 0),
                  Text(
                    'Escoge un horario',
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )));
  }
}
