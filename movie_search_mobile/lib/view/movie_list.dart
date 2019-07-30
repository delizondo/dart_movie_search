import 'package:flutter/material.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_mobile/view/movie_widget.dart';

class MovieList extends StatelessWidget {
  final List<MovieItem> _movieList;

  const MovieList(this._movieList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movieList.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieWidget(_movieList[index]);
      },
    );
  }
}
