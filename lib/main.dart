import 'package:flutter/material.dart';
import 'package:movies/src/pages/home_page.dart';
import 'package:movies/src/pages/movies_details_page.dart';
import 'package:movies/src/pages/reviews_page.dart';
import 'package:movies/src/provider/movies_provider.dart';
import 'package:movies/src/shared_preferences/movies_sharedPreferences.dart';

void main() async {
  final prefs = new MoviesSharedPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefs = new MoviesSharedPreferences();
  final moviesProvider = new MoviesProvider();

  @override
  void dispose() {
    moviesProvider.disposeStream();
    prefs.clearMovieFavorites();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      theme: ThemeData(
        primaryColor: Colors.green,
        secondaryHeaderColor: Colors.lightGreen

      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'details': (BuildContext context) => MovieDetails(),
        'reviews': (BuildContext context) => ReviewsPage(),
      },
    );
  }
}
