import 'package:equatable/equatable.dart';

class TvRecommendations extends Equatable {
  final int id;
  final String? backdropPath;

  const TvRecommendations({required this.id, required this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}