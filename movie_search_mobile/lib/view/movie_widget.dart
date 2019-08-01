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
    return Card(
      elevation: 2.0,
      child: Container(child: LayoutBuilder(
        builder: (context, constraints) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: CachedNetworkImage(
              height: constraints.maxHeight,
              fit: BoxFit.fill,
              imageUrl: widget.movieItem.poster,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          );
        },
      )),
    );
  }
}
