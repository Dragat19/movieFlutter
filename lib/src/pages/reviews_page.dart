import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';
import 'package:movies/src/provider/reviews_provider.dart';
import 'package:movies/src/widget/reviewWidget_Widget.dart';

class ReviewsPage extends StatelessWidget {
  final reviewsProvider = new ReviewProvider();

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Comentarios de ${movie.title}'),
        ),
        body: Container(
          child: reviewsListView(movie),
        ));
  }

  Widget reviewsListView(Movie movie) {
    reviewsProvider.getReviews(movie.id);
    return StreamBuilder(
      stream: reviewsProvider.reviewStream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            return ReviewsWidget(
              review: snapshot.data,
            );
          } else {
            return withoutComments();
          }
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
}

Widget withoutComments() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 250.0),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.insert_comment,
            color: Colors.green,
            size: 100.0,
          ),
          Text('Sin comentarios ☹️')
        ],
      ),
    ),
  );
}
