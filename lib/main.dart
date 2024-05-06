import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/config/injection/injection.dart';
import 'core/config/router/app_router.dart';
import 'core/config/themes/app_theme.dart';
import 'core/utils/constants/app_constants.dart';
import 'data/dataSources/remote/user_data_source.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://juecngbbokrvvgpngzgq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp1ZWNuZ2Jib2tydnZncG5nemdxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MDYwNDEsImV4cCI6MjAyOTk4MjA0MX0._D6IUCZUDzoe5_6MqYdPUxlpHcMim2PYAEDh5z-WU44',
  );
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
