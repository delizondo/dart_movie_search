import 'dart:convert';

import 'package:movie_search_core/src/constants.dart';
import 'package:movie_search_core/src/model/movie_feed.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<MovieFeed> getMoviesByTitle(String title, int page) async {
    var url = HOST +
        "/?apikey=" +
        OMDB_KEY +
        "&s=" +
        title +
        "&page=" +
        page.toString();

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return MovieFeed.fromJson(results);
    } else {
      return null;
    }
  }
}
