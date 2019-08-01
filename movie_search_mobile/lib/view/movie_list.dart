import 'package:flutter/material.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_mobile/app_config.dart';
import 'package:movie_search_mobile/view/movie_widget.dart';

/*class MovieList extends StatelessWidget {
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
}*/

class MovieList extends StatefulWidget {
  final List<MovieItem> _movieList;
  final SearchBloc _searchBloc;

  MovieList(this._movieList, this._searchBloc);
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 100 && !_isLoading) {
      _isLoading = true;

      var searchData = AppConfig.of(context).searchData;
      var nextPage = searchData.page + 1;
      widget._searchBloc
          .dispatch(SearchEvent(text: searchData.searchTerm, page: nextPage));
      AppConfig.of(context).searchData.page = nextPage;
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: widget._movieList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return MovieWidget(widget._movieList[index]);
      },
    );

    /*return GridView.count(
        controller: _scrollController,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: List.generate(widget._movieList.length, ((index) {
          return MovieWidget(widget._movieList[index]);
        })));
  }*/
  }
}
