import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String? backdropPath;
  final int id;
  final String name;
  final String overview;
  final int voteAverage;
  final List<int> generIds;

  const Tv({
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.generIds,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        name,
        overview,
        voteAverage,
        generIds,
      ];
}
