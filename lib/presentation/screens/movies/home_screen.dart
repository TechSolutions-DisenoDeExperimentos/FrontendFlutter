import 'package:tu_cine_app/presentation/providers/api_moviedb/movies/initial_loading_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_moviedb/movies/movies_providers.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/cineclubs/cineclubs_provider.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/movies/movies_providers.dart';
import 'package:tu_cine_app/presentation/providers/api_moviedb/movies/movies_slideshow_provider.dart';
import 'package:tu_cine_app/presentation/screens/profile/profile_screen.dart';
import 'package:tu_cine_app/presentation/screens/tickets/my_tickets_screen.dart';
import 'package:tu_cine_app/presentation/widgets/movies/cineclub_horizontal_listview.dart';
import 'package:tu_cine_app/presentation/widgets/movies/movie_horizontal_listview_tucine.dart';
import 'package:tu_cine_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [const _HomeView(), const MyTicketsScreen(), const ProfileScreen()];
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
              icon: Icon(Icons.airplane_ticket_outlined),
              activeIcon: Icon(Icons.airplane_ticket),
              label: 'Tickets'),
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

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(moviesProvider.notifier).getNowPlayingMovies();
    ref.read(cineclubsProvider.notifier).getCineclubs();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    //if (initialLoading) return const FullScreenLoader();

    //final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    //final popularMovies = ref.watch(popularMoviesProvider);
    //final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final tuCineMovies = ref.watch(moviesProvider);
    final cineclubs = ref.watch(cineclubsProvider);

    if (slideShowMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }



    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        slivers: [
      
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
            ),
          ),
      
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(children: [
                //const CustomAppbar(),
                MoviesSlideshow(movies: slideShowMovies),
                /*MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'On theathers',
                  subtitle: 'Movies',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                
                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Popular',
                  subtitle: 'Movies',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Top rated',
                  subtitle: 'Movies',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
                */
                CineclubHorizontalListview(
                  cineclubs: cineclubs,
                  name: 'Cineclubs',
                  subtitle: 'Cineclubs',
                  loadNextPage: () => ref
                      .read(cineclubsProvider.notifier)
                      .getCineclubs(), //Scroll infinitamente
                  ),

                  MovieHorizontalListViewTuCine(
                  movies: tuCineMovies,
                  title: 'En cartelera',
                  subtitle: 'Movies',
                  loadNextPage: () {
                    ref.read(moviesProvider.notifier).getNowPlayingMovies();
                  },
                ),

                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  subtitle: 'Movies',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),

                const SizedBox(height: 10),
              ]);
            },
            childCount: 1,
          )),
        ],
      ),
    );
  }
}
