import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation/screens/user_details_screen.dart';


@singleton
class AppRouter {
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
    GoRoute(
    path: '/',
    builder: (context, state) => const UserDetailsScreen(),
  ),
  //     GoRoute(
  // path: '/profile',
  // builder: (context, state) => const UserDetailsScreen(),
  // ),
]
  );

  GoRouter get router => _router;
}

