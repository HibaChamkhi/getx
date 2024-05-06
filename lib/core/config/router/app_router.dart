import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../../presentation/screens/sign_in.dart';
import '../../../presentation/screens/sign_up.dart';
import '../../../presentation/screens/user_details_screen.dart';


@singleton
class AppRouter {
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
    GoRoute(
    path: '/',
    builder: (context, state) => GetStorage().read('token') != null ? const UserDetailsScreen() : const SignIn(),
  ),
  //     GoRoute(
  // path: '/profile',
  // builder: (context, state) => const UserDetailsScreen(),
  // ),
]
  );

  GoRouter get router => _router;
}

