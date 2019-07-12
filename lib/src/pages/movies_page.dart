import 'package:flutter/material.dart';
import 'package:movies/Constants.dart';
import 'package:movies/src/provider/movies_provider.dart';
import 'package:movies/src/widget/gridMovies_Widget.dart';

class MoviesPage extends StatelessWidget {
  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie BD'),
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              onSelected: choicesAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map( (String choices) {
                  return PopupMenuItem<String>(
                    value: choices,
                    child: Text(choices),
                  );
                } ).toList(); 
              },
            )
          ],
          ),
        body: Container(
          child: moviesListView(),
        )
        );
  }

  Widget moviesListView() {
    moviesProvider.getMoviesPopular();

    return StreamBuilder(
      stream: moviesProvider.moviesStream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return GridMoviesWidget(
            movies: snapshot.data,
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  void choicesAction(String choice){
    if(choice == Constants.now_playing){
        print('now_playing');
        moviesProvider.moviesNowPlayingItemsClear();
        moviesProvider.getMoviesNowPlaying();
    } else if(choice == Constants.popular){
        print('popular');
        moviesProvider.moviesPopularItemsClear();
        moviesProvider.getMoviesPopular();
    }
  }

}