import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String? backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;
  final List<Geners> geners;

  const MovieDetails({
    required this.geners,
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
        geners
      ];
}

class Geners extends Equatable {
  final String name;
  final int id;

  const Geners({
   required this.name,
   required this.id,
  });

  @override
  List<Object> get props => [
    id ,name,
  ];
}
