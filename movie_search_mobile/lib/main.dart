import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_mobile/app_config.dart';
import 'package:movie_search_mobile/view/search_content.dart';

import 'view/search_widget.dart';

void main() {
  var appConfig = AppConfig(
    repository: Repository(),
    child: MyApp(),
  );

  runApp(appConfig);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Repository _repository = AppConfig.of(context).repository;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dart Movie Search"),
          ),
          body: BlocProvider(
            builder: (context) => SearchBloc(_repository),
            child: Container(
                color: Colors.grey[900],
                child: Column(
                  children: <Widget>[SearchWidget(), SearchContent()],
                )),
          ),
        ));
  }
}
