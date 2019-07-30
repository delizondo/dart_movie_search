import 'package:flutter/cupertino.dart';
import 'package:movie_search_core/movie_search_core.dart';

class AppConfig extends InheritedWidget {
  final Repository repository;

  AppConfig({@required this.repository, @required Widget child})
      : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
