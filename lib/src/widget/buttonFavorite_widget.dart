import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/pages/home_page.dart';
import 'package:movies/src/shared_preferences/movies_sharedPreferences.dart';

class ButtonFavoriteWidget extends StatefulWidget {
  final List<Movie> movies;
  final int index;
  ButtonFavoriteWidget( {@required this.movies, @required this.index});

  _ButtonFavoriteWidgetState createState() => _ButtonFavoriteWidgetState();
}

class _ButtonFavoriteWidgetState extends State<ButtonFavoriteWidget> {

  final prefs = new MoviesSharedPreferences();
  
  @override
  Widget build(BuildContext context) {
    return btnFavorite(widget.movies, widget.index);
  }

  Widget btnFavorite(List<Movie> movies,int index) {
    final btnFav = Positioned(
        right: 5.0,
        top: 5.0,
        child: GestureDetector(
          onTap: () {
            setState(() {
               movies[index].isFavorite = !movies[index].isFavorite;
               if(movies[index].isFavorite){
                 prefs.addMovieFavorite = movies[index];
               }else {
                 prefs.removeMovieFavorite = movies[index];
                 Navigator.pushReplacement(context,new MaterialPageRoute(builder: (context) => new HomePage()));
               }
             });
          },
           child: movies[index].isFavorite ? Icon(Icons.favorite, color: Colors.lightGreen) :Icon(Icons.favorite_border, color: Colors.lightGreen),
        ));

    return btnFav;
  }
}



