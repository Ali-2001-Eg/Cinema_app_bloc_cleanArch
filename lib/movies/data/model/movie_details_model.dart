import 'package:equatable/equatable.dart';
import 'package:payment_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.geners,
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        //how to receive list ob object
        geners: List<GenersModel>.from(
            json['genres'].map((e) => GenersModel.fromJson(e))),
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}

class GenersModel extends Geners {
  const GenersModel({
    required super.name,
    required super.id,
  });
  factory GenersModel.fromJson(Map<String, dynamic> json) => GenersModel(
        name: json['name'],
        id: json['id'],
      );
}
