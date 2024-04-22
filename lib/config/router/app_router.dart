import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', name: HomeScreen.routeName, builder: (context, state) {
    return const HomeScreen();
  }),
]);

