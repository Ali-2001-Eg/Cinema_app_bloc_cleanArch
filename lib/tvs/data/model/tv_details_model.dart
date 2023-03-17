import 'package:payment_app/tvs/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.backdropPath,
    required super.overview,
    required super.id,
    required super.firstAirDate,
    required super.geners,
    required super.voteAverage,
    required super.seasonsNo,
    required super.episodesNo,
    required super.name,
  });
  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        backdropPath:
            json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        overview: json['overview'],
        id: json['id'],
        firstAirDate: json['first_air_date'],
    geners:List<GenresModel>.from(
        json['genres'].map((e) => GenresModel.fromJson(e))),
        voteAverage: json['vote_average'],
        seasonsNo: json['number_of_seasons'],
        episodesNo: json['number_of_episodes'],
        name: json['name'],
      );
}
class GenresModel extends Genres{
  const GenresModel({required super.name, required super.id});
  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
    name: json['name'],
    id: json['id'],
  );
}
