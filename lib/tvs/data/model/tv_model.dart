import '../../domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required super.backdropPath,
    required super.id,
    required super.name,
    required super.overview,
    required super.voteAverage,
    required super.generIds,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        backdropPath: json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toInt(),
        generIds: List<int>.from(json['genre_ids'].map((e) => e)),
      );
}
