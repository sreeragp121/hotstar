class ModelTv {
  final int id;
  final String title;
  final String posterPath;
  final String releasedate;

  ModelTv(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.releasedate});

  factory ModelTv.fromJson(Map<String, dynamic> json) {
    return ModelTv(
      id: json['id'],
      title: json['original_name'],
      posterPath: json['poster_path'],
      releasedate: json['first_air_date'],
    );
  }
}
