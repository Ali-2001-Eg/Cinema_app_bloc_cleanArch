import 'package:equatable/equatable.dart';

class TvDetails extends Equatable {
  final String? backdropPath;
  final String overview;
  final int id;
  final String firstAirDate;
  final List<Genres> geners;
  final double voteAverage;
  final int seasonsNo;
  final int episodesNo;
  final String name;


  const TvDetails({
    required this.backdropPath,
    required this.overview,
    required this.id,
    required this.firstAirDate,
    required this.geners,
    required this.voteAverage,
    required this.seasonsNo,
    required this.episodesNo,
    required this.name,
  });

  @override
  List<Object?> get props =>
      [
        backdropPath,
        overview,
        id,
        firstAirDate,
        geners,
        voteAverage,
        seasonsNo,
        episodesNo,
        name,
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({required this.name, required this.id});

  @override
  List<Object> get props => [id, name];
}
