import 'package:go_router/go_router.dart';
import 'package:pokemons_app/features/home/home.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
]);
