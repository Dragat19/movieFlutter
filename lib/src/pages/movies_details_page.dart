import 'package:flutter/material.dart';
import 'package:movies/src/models/movies_model.dart';

class MovieDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final Movie movie = ModalRoute.of(context).settings.arguments;
   
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        createAppBar(movie),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            posterTitle(context, movie),
            description(movie),
            buttonReview(context,movie)
          ]),
        )
      ],
    ));
  }

  Widget createAppBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget posterTitle(BuildContext context, Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(movie.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(movie.originalTitle,
                    style: Theme.of(context).textTheme.title,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_half,
                      color: Colors.yellow,
                    ),
                    Text(
                      '${movie.voteAverage.toString()} / 10.0',
                      style: Theme.of(context).textTheme.subhead,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.people),
                    Text(
                      'votos: ${movie.voteCount.toString()}',
                      style: Theme.of(context).textTheme.subhead,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.date_range),
                    Text(
                      movie.releaseDate,
                      style: Theme.of(context).textTheme.subhead,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget description(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget buttonReview(BuildContext context,Movie movie) {
    final btnReview = Center(
       child: RaisedButton(
         onPressed: ()  {
            Navigator.pushNamed(context, 'reviews', arguments: movie);
         },
         color: Colors.green,
         textColor: Colors.white,
         padding: EdgeInsets.all(10.0),
         child: Column(
           children: <Widget>[
             Icon( Icons.comment),
             Text('Leer comentarios')
           ],
         ),
       ), 
    );

     return btnReview;
  }


}
