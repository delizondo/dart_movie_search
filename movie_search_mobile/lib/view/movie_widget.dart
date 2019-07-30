import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_search_core/movie_search_core.dart';

class MovieWidget extends StatefulWidget {
  final MovieItem movieItem;

  const MovieWidget(this.movieItem);

  @override
  _MovieWidgetState createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: widget.movieItem.poster,
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          )
        ],
      ),
    );
  }
}
