import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/presentation/providers/movies/api_moviedb/initial_loading_provider.dart';
import 'package:tu_cine_app/presentation/providers/movies/api_moviedb/movies_providers.dart';
import 'package:tu_cine_app/presentation/screens/movies/movie_favorite_screen.dart';
import 'package:tu_cine_app/presentation/screens/profile/profile_screen.dart';
import 'package:tu_cine_app/presentation/screens/search/search_screen.dart';
import 'package:tu_cine_app/presentation/screens/tickets/my_tickets_screen.dart';
import 'package:tu_cine_app/presentation/widgets/movies/cineclub_horizontal_listview.dart';


import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [const _HomeView(), const MovieFavoriteScreen(), const SearchScreen(), const MyTicketsScreen(), const ProfileScreen()];

    return Scaffold(
      body: IndexedStack(
      index: selectedIndex,
      children: screens,
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled),
              label: 'Explorar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite),
              label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_outlined),
              activeIcon: Icon(Icons.airplane_ticket),
              label: 'Ticket'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: 'Perfil'),
        ],
      ),
      );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(cineclubsProvider.notifier).getCineclubs();
    ref.read(moviesProvider.notifier).getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    //final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    if (slideShowMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final cineclubs = ref.watch(cineclubsProvider);

    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
      
          //Widget que trabaj directamente con scrollview
          slivers: [
      
            const SliverAppBar(
              //backgroundColor: Colors.white,
              //expandedHeight: 0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppbar()
              ),
              //pinned: false,
              //snap: false,
              //elevation: 0,
            ),
      
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  //const CustomAppbar(),
                  MoviesSlideshow(movies: slideShowMovies),
             
                  CineclubHorizontalListview(
                    cineclubs: cineclubs,
                    name: 'Cineclubs',
                    subtitle: 'Ver más',
                    loadNextPage: () => ref
                        .read(cineclubsProvider.notifier)
                        .getCineclubs(), //Scroll infinitamente
                    
                  ),
      
                 MoviesHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cartelera',
                    subtitle: 'Ver más',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(), //Scroll infinitamente)
                ),

                   MoviesHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    subtitle: 'Ver más',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNextPage(), //Scroll infinitamente
                  ),             
      
                  const SizedBox(height: 10),
                ],
              );
            }, childCount: 1)),
          ]),
    );
  }
}
