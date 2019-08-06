import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:movie_search_core/movie_search_core.dart';

@Component(
    selector: "result-item",
    templateUrl: "result_item_component.html",
    styleUrls: ["result_item_component.css"],
    directives: [coreDirectives])
class ResultItem {
  @Input()
  MovieItem movieItem;
}
