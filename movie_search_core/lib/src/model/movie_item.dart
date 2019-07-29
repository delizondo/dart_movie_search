class MovieItem {
  String title;
  String year;
  String imdbId;
  String type;
  String poster;

  MovieItem({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      title: json["Title"],
      year: json["Year"],
      imdbId: json["imdbID"],
      type: json["Type"],
      poster: json["Poster"],
    );
  }
}
