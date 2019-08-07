import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_components/utils/browser/window/module.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_web/src/components/search_results/search_result_component.dart';
import 'package:movie_search_web/src/model/search_data.dart';

@Component(
    selector: "search-body",
    templateUrl: "search_body_component.html",
    directives: [coreDirectives, SearchResult])
class SearchBody implements AfterViewInit {
  final SearchData _searchData;

  @Input()
  SearchState searchState;

  @Input()
  SearchBloc searchBloc;

  SearchBody(this._searchData);

  bool get isEmpty => searchState.requestState == null;
  bool get isLoading => searchState.requestState == RequestState.LOADING;
  bool get isSuccess => searchState.requestState == RequestState.SUCCESS;
  bool get isError => searchState.requestState == RequestState.ERROR;

  List<MovieItem> get items => isSuccess ? searchState.movieList : List();

  String get errorMessage => isError ? searchState.message : "";

  @override
  void ngAfterViewInit() {
    getWindow().onScroll.listen(_checkScroll);
  }

  void _checkScroll(Event e) {
    DivElement successDiv = querySelector("#success");
    var windowBottom = getWindow().innerHeight + getWindow().pageYOffset;
    var shouldLoad = windowBottom >= successDiv.scrollHeight;
    if (shouldLoad) {
      print("loading");
      _searchData.page++;
      searchBloc.dispatch(
          SearchEvent(text: _searchData.searchTerm, page: _searchData.page));
    }
  }
}
