class MovieModel {
  String title;
  String overview;
  String posterPath;

  MovieModel(
      {required this.title, required this.overview, required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json["title"] as String,
        overview: json["overview"] as String,
        posterPath: json["poster_path"] as String);
  }

  String get posterurl => "https://image.tmdb.org/t/p/w500/$posterPath";
}
