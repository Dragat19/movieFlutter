import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/widget/buttonFavorite_Widget.dart';


class GridMoviesWidget extends StatelessWidget {
 final List<Movie> movies;
  const GridMoviesWidget({@required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        primary: false,
        childAspectRatio: 0.67,
        children: List.generate(movies.length, (index) {
          if(movies != null){
            return cardItems(movies, index, context);
          }
        }));
  }

    Widget cardItems(List<Movie> movies, int index, context) {
    final cardItems = Card(
        color: Colors.black87,
        child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              Stack(
                children: <Widget>[
                  imgMovies(movies, index, context),
                  ButtonFavoriteWidget(movies: movies,index: index)
                ],
              ),
            ])));

    return cardItems;
  }

  Widget imgMovies(List<Movie> movies, int index, BuildContext context) {
    final imgMovies = FadeInImage(
      image: NetworkImage(movies[index].getPosterImg()),
      placeholder: AssetImage('assets/img/no-image.jpg'),
      fit: BoxFit.cover,
    );
    return GestureDetector(
      child: imgMovies,
      onTap: () {
        print('id movies: ${movies[index].id}');
        Navigator.pushNamed(context, 'details', arguments: movies[index]);
      },
    );
  }




  
}
