import 'package:flutter/material.dart';
import 'package:movies/src/pages/favorite_page.dart';
import 'package:movies/src/pages/movies_page.dart';
import 'package:movies/src/provider/movies_provider.dart';
import 'package:movies/src/shared_preferences/movies_sharedPreferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final moviesProvider = new MoviesProvider();
 final prefs = new MoviesSharedPreferences();
 int currentIndex = 0;


 @override
  void dispose() {
    moviesProvider.disposeStream();
    prefs.clearMovieFavorites();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: callPages(currentIndex),
        ),
         bottomNavigationBar: createBottomNavBar(),
        );
  }

  Widget createBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_filter),
          title: Text('Peliculas')
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favoritas')
        )
      ],
    );
  }

  Widget callPages( int page) {
    switch(page){
      case 0:
        return MoviesPage();
      case 1:
        return  FavoritePage();
      default:
        return MoviesPage();
    }

  }
}


