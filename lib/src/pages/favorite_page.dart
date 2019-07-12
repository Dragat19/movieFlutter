import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/shared_preferences/movies_sharedPreferences.dart';
import 'package:movies/src/widget/gridMovies_Widget.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final prefs = new MoviesSharedPreferences();

 Future<List<Movie>> loadFavorites;

  @override
  void initState() {
    loadFavorites = prefs.getMovieFavorite();
    super.initState();
  }

  @override
  void setState(fn) {
    loadFavorites = prefs.getMovieFavorite();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
        ),
        body: Container(
          child: favoriteListView(),
        ));
  }

  Widget favoriteListView() {
    return FutureBuilder(
      future: loadFavorites,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        print(snapshot.hasData);
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return GridMoviesWidget(
              movies: snapshot.data,
            );
          }
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0,vertical: 250.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.movie,color: Colors.green,size: 100.0, ),
                  Text('Todavia no tienes favoritos ☹️')
                ],
              ),
            ),
          );
        }
      },
    );
  }






}
