import 'package:movie_search_core/src/model/movie_feed.dart';

class SearchState {
  State state;
  MovieFeed movieFeed;
  String message;

  SearchState.ERROR(this.state, this.message);

  SearchState.LOADING(this.state);

  SearchState.SUCCESS(this.state, this.movieFeed);

  SearchState.EMPTY();
}

enum State { LOADING, SUCCESS, ERROR }
