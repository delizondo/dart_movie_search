import 'package:angular/angular.dart';
import 'package:movie_search_core/movie_search_core.dart';

import 'src/components/search_form/search_form_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/componentsß

@Component(
    selector: 'my-app',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [SearchFormComponent],
    providers: [
      ClassProvider(Repository),
    ])
class AppComponent {
  
}
