import 'package:payment_app/movies/domain/entities/movies.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.releaseDate,
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genderIds,
    required super.overview,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      releaseDate: json['release_date'],
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genderIds:List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      // TODO : CHECK THIS LATER
      voteAverage: json['vote_average'].toDouble(),
    );
}
