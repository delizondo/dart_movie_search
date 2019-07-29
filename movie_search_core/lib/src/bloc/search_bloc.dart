import 'package:bloc/bloc.dart';
import 'package:movie_search_core/src/bloc/search_event.dart';
import 'package:movie_search_core/src/bloc/search_state.dart';
import 'package:movie_search_core/src/repository/repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc(this.repository);

  @override
  SearchState get initialState => SearchState.EMPTY();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event.text.isEmpty) {
      yield SearchState.EMPTY();
    } else {
      yield SearchState.LOADING(State.LOADING);
      try {
        final result =
            await repository.getMoviesByTitle(event.text, event.page);
        yield SearchState.SUCCESS(State.SUCCESS, result);
      } catch (error) {
        yield SearchState.ERROR(State.ERROR, error.toString());
      }
    }
  }
}
