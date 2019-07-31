import 'package:flutter/material.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_mobile/view/movie_widget.dart';

class MovieList extends StatelessWidget {
  final List<MovieItem> _movieList;

  const MovieList(this._movieList);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: List.generate(_movieList.length, ((index) {
          return MovieWidget(_movieList[index]);
        })));
  }
}
