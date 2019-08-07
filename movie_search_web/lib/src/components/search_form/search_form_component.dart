import 'package:angular/core.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_web/src/components/search_bar/search_bar_component.dart';
import 'package:movie_search_web/src/components/search_body/search_body_component.dart';
import 'package:movie_search_web/src/model/search_data.dart';

@Component(
    selector: "search-form",
    templateUrl: "search_form_component.html",
    directives: [
      SearchBar,
      SearchBody
    ],
    pipes: [
      BlocPipe
    ],
    providers: [
      ClassProvider(SearchData),
    ])
class SearchFormComponent implements OnInit, OnDestroy {
  final Repository _repository;
  SearchBloc searchBloc;

  SearchFormComponent(this._repository);

  @override
  void ngOnInit() {
    searchBloc = SearchBloc(this._repository);
  }

  @override
  void ngOnDestroy() {
    searchBloc.dispose();
  }
}
