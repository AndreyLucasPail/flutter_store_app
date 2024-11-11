import 'package:flutter/material.dart';
import 'package:flutter_store_app/routes/app_routes.dart';
import 'package:flutter_store_app/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.tag,
      onGenerateRoute: AppRoutes.genereteRoutes,
    );
  }
}
