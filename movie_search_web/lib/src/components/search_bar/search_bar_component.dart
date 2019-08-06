import 'dart:html';

import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:movie_search_core/movie_search_core.dart';

@Component(
    selector: "search-bar",
    templateUrl: "search_bar_component.html",
    directives: [formDirectives])
class SearchBar {
  @Input()
  SearchBloc searchBloc;

  void onSubmit() {
    InputElement search = querySelector("#search_bar");
    searchBloc.dispatch(SearchEvent(text: search.value, page: 1));
  }
}
