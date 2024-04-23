import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/config/injection/injection.dart';
import 'core/config/router/app_router.dart';
import 'core/config/themes/app_theme.dart';
import 'core/utils/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

final _router = locator<AppRouter>().router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: _router,
    );
  }
}
