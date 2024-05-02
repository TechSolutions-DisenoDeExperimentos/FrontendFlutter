import 'package:cine_app/presentation/screens/auth/log_in.dart';
import 'package:cine_app/presentation/screens/cineclubs/cineclubs_screen.dart';
import 'package:cine_app/presentation/screens/cineclubs/showtime_screen.dart';
import 'package:cine_app/presentation/screens/movies/movie_tu_cine_screen.dart';
import 'package:cine_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginPage.name,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
        GoRoute(
          path: 'movie-tu-cine/:id',
          name: MovieTuCineScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieTuCineScreen(movieId: movieId);
          },
        ),
        GoRoute(
          path: 'cineclub/:id',
          name: CineclubScreen.name,
          builder: (context, state) {
            final cineclubId = state.pathParameters['id'] ?? 'no-id';
            return CineclubScreen(cineclubId: cineclubId);
          },
        ),
        GoRoute(
          path: 'movie/:movieId/cineclubs/:cineclubId', 
          name: ShowtimeScreen.routeName, 
          builder: (context, state) {
            final movieId = state.pathParameters['movieId'] ?? '';
            final cineclubId = state.pathParameters['cineclubId'] ?? '';  
            return ShowtimeScreen(movieId: movieId, cineclubId: cineclubId);
    }


  )
      ],
    ),
  ],
);
