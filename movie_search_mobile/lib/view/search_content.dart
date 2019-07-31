import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_core/movie_search_core.dart';

import 'movie_list.dart';

class SearchContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: BlocProvider.of<SearchBloc>(context),
        builder: (BuildContext context, SearchState state) {
          if (state.requestState == null) {
            return Text('Please enter a movie name to begin');
          } else if (state.requestState == RequestState.LOADING) {
            return CircularProgressIndicator();
          } else if (state.requestState == RequestState.ERROR) {
            return Text(state.message);
          } else {
            return (state.movieFeed == null || state.movieFeed.search.isEmpty)
                ? Text("No Results")
                : Expanded(
                    child: MovieList(state.movieFeed.search),
                  );
          }
        });
  }
}
