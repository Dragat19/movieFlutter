import 'dart:async';

import 'package:movies/src/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

List<Movie> _moviesFav = [];

class MoviesSharedPreferences {
  static final MoviesSharedPreferences _instancia =
      new MoviesSharedPreferences._internal();

  factory MoviesSharedPreferences() {
    return _instancia;
  }

  MoviesSharedPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  set addMovieFavorite(Movie movie) {
    final String movieKey = movie.id.toString();
    _prefs.setString(movieKey, json.encode(movie.toJson()));
    _moviesFav.add(movie);
  }

  Future<List<Movie>> getMovieFavorite() async {
    if (_moviesFav.length != 0 ) {
      _moviesFav.map((Movie mv) => {new Movie.fromJsonMap(json.decode(_prefs.getString(mv.id.toString())))});
      return _moviesFav;
    } else {
      return null;
    }
  }

  set removeMovieFavorite(Movie movie) {
    _prefs.remove(movie.id.toString());
    _moviesFav.remove(movie);
  }

  Future<void> clearMovieFavorites() async {
    _prefs.clear();
  }
}
