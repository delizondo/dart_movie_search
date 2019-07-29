import 'package:movie_search_core/src/model/movie_item.dart';

class MovieFeed {
  List<MovieItem> search;
  String totalResults;

  MovieFeed({this.search, this.totalResults});

  factory MovieFeed.fromJson(Map<String, dynamic> json) {
    var movieListJson = json["Search"];
    var movieList = List<MovieItem>.from(
        movieListJson.map((item) => MovieItem.fromJson(item))).toList();

    return MovieFeed(search: movieList, totalResults: json["totalResults"]);
  }
}
