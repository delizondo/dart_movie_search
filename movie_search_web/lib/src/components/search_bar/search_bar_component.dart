import 'dart:html';

import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_web/src/model/search_data.dart';

@Component(
    selector: "search-bar",
    templateUrl: "search_bar_component.html",
    directives: [formDirectives])
class SearchBar {
  final SearchData _searchData;

  @Input()
  SearchBloc searchBloc;

  SearchBar(this._searchData);

  void onSubmit() {
    InputElement search = querySelector("#search_bar");
    _searchData.page = 1;
    _searchData.searchTerm = search.value.trim();
    searchBloc.dispatch(
        SearchEvent(text: _searchData.searchTerm, page: _searchData.page));
  }
}
