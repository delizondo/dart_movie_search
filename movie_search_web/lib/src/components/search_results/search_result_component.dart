import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_web/src/components/result_item/result_item_component.dart';

@Component(
    selector: "search-result",
    templateUrl: "search_result_component.html",
    styleUrls: ["search_result_component.css"],
    directives: [coreDirectives, ResultItem])
class SearchResult implements OnInit {
  @Input()
  List<MovieItem> movieList;

  @override
  void ngOnInit() {
    DivElement scrollable = querySelector("#scrollable");
    scrollable.onScroll.listen((Event event) => print("its scrolling"));
  }
}
