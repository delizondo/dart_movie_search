import 'package:bloc/bloc.dart';
import 'package:movie_search_core/src/bloc/search_event.dart';
import 'package:movie_search_core/src/bloc/search_state.dart';
import 'package:movie_search_core/src/model/movie_item.dart';
import 'package:movie_search_core/src/repository/repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc(this.repository);

  @override
  SearchState get initialState => SearchState.EMPTY();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    List<MovieItem> movieFeed;
    if (event.text.isEmpty) {
      yield SearchState.EMPTY();
    } else {
      if (currentState.requestState == null) {
        yield SearchState.LOADING(RequestState.LOADING);
      }
      try {
        final result =
            await repository.getMoviesByTitle(event.text, event.page);
        if (currentState.requestState == RequestState.SUCCESS) {
          movieFeed = currentState.movieList;
          movieFeed.addAll(result.search);
        } else {
          movieFeed = result.search;
        }
        yield SearchState.SUCCESS(RequestState.SUCCESS, movieFeed);
      } catch (error) {
        yield SearchState.ERROR(RequestState.ERROR, error.toString());
      }
    }
  }
}
