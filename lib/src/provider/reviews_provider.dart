import 'dart:async';
import 'dart:convert';

import 'package:movies/src/models/reviews_model.dart';
import 'package:http/http.dart' as http;

class ReviewProvider {

  String _apiKey = '15f62e0ab818586ffb5fff5e183db72e';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

  List<Review> reviewsItems = new List();

  final reviewsStremController = StreamController<List<Review>>.broadcast();

  Function(List<Review>) get reviewSink => reviewsStremController.sink.add;

  Stream<List<Review>> get reviewStream => reviewsStremController.stream;

  void disposeStream() {
    reviewsStremController.close();
  }

  Future<List<Review>> getReviews(int id) async {
    final url = Uri.http(_url, '3/movie/$id/reviews', {'api_key': _apiKey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final reviews = new Reviews.fromJsonList(decodedData['results']);
    reviewsItems.addAll(reviews.items);
    reviewSink(reviewsItems);
    return reviews.items;
  }


  



}