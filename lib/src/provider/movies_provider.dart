import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/movies_model.dart';


class MoviesProvider {
  String _apiKey = '15f62e0ab818586ffb5fff5e183db72e';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> moviesPopularItems = new List();
  List<Movie> moviesNowPlayingItems = new List();

  final moviesStremController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get moviesSink => moviesStremController.sink.add;

  Stream<List<Movie>> get moviesStream => moviesStremController.stream;

  void disposeStream() {
    moviesStremController.close();
  }

  void moviesPopularItemsClear() {
    moviesPopularItems.clear();
  }

  void moviesNowPlayingItemsClear() {
    moviesNowPlayingItems.clear();
  }

  Future<List<Movie>> getMoviesNowPlaying() async {
    final url = Uri.http(
        _url, '3/movie/top_rated', {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    print(movies.items[0].isFavorite);
    moviesNowPlayingItems.addAll(movies.items);
    moviesSink(moviesNowPlayingItems);
    return movies.items;
  }




  Future<List<Movie>> getMoviesPopular() async {
    final url = Uri.http(
        _url, '3/movie/popular', {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    print(movies.items.length);
    moviesPopularItems.addAll(movies.items);
    moviesSink(moviesPopularItems);
    return movies.items;
  }

}
