import 'package:movie_search_core/src/model/movie_feed.dart';

class SearchState {
  RequestState requestState;
  MovieFeed movieFeed;
  String message;

  SearchState.ERROR(this.requestState, this.message);

  SearchState.LOADING(this.requestState);

  SearchState.SUCCESS(this.requestState, this.movieFeed);

  SearchState.EMPTY();
}

enum RequestState { LOADING, SUCCESS, ERROR }
