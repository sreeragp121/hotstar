class Movie{
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releasedate;
  final bool adult;
  final String language;
  final String background;
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releasedate,
    required this.adult,
    required this.language,
    required this.background,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releasedate: json['release_date'],
      adult: json['adult'],
      language: json['original_language'],
      background: json['backdrop_path'],
    );
  }
}