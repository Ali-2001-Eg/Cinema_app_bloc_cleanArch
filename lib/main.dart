import 'package:flutter/material.dart';
import 'package:payment_app/core/services/services_locator.dart';
import 'package:payment_app/core/utils/app_strings.dart';
import 'package:payment_app/core/utils/home_page/bottom_nav_bar.dart';
import 'package:payment_app/tvs/presentation/screens/tvs_screen.dart';
import 'movies/presentation/screens/movies_screen.dart';


void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const HomePage(),
    );
  }
}
