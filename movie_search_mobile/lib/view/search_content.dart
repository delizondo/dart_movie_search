import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_core/movie_search_core.dart';

import 'movie_list.dart';

/*class SearchContent extends StatelessWidget {
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
}*/

class SearchContent extends StatefulWidget {
  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: _searchBloc,
        builder: (BuildContext context, SearchState state) {
          if (state.requestState == null) {
            return Text('Please enter a movie name to begin');
          } else if (state.requestState == RequestState.LOADING) {
            return CircularProgressIndicator();
          } else if (state.requestState == RequestState.ERROR) {
            return Text(state.message);
          } else {
            return (state.movieList == null || state.movieList.isEmpty)
                ? Text("No Results")
                : Expanded(
                    child: MovieList(state.movieList, _searchBloc),
                  );
          }
        });
  }
}
