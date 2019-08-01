import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_core/src/model/movie_feed.dart';

class SearchState {
  RequestState requestState;
  List<MovieItem> movieList;
  String message;

  SearchState.ERROR(this.requestState, this.message);

  SearchState.LOADING(this.requestState);

  SearchState.SUCCESS(this.requestState, this.movieList);

  SearchState.EMPTY();
}

enum RequestState { LOADING, SUCCESS, ERROR }
