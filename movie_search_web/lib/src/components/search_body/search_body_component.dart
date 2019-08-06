import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_web/src/components/search_results/search_result_component.dart';

@Component(
    selector: "search-body",
    templateUrl: "search_body_component.html",
    directives: [coreDirectives, SearchResult])
class SearchBody {
  @Input()
  SearchState searchState;

  bool get isEmpty => searchState.requestState == null;
  bool get isLoading => searchState.requestState == RequestState.LOADING;
  bool get isSuccess => searchState.requestState == RequestState.SUCCESS;
  bool get isError => searchState.requestState == RequestState.ERROR;

  List<MovieItem> get items => isSuccess ? searchState.movieList : List();

  String get errorMessage => isError ? searchState.message : "";
}
