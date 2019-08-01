import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_core/movie_search_core.dart';
import 'package:movie_search_mobile/app_config.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _textController = TextEditingController();

  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onClearTapped() {
    _textController.text = '';
    _storeSearchData("");
    _searchBloc.dispatch(SearchEvent(text: '', page: 1));
  }

  _storeSearchData(String text) {
    AppConfig.of(context).searchData.page = 1;
    AppConfig.of(context).searchData.searchTerm = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (text) {
          _storeSearchData(text);
          _searchBloc.dispatch(SearchEvent(text: text, page: 1));
        },
        controller: _textController,
        decoration: InputDecoration(
            hintText: "Type a movie name",
            prefixIcon: Icon(Icons.search),
            suffixIcon: GestureDetector(
              child: Icon(Icons.clear),
              onTap: _onClearTapped,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
