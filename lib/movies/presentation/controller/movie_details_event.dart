part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  //to be parameter for function in bloc logic
  final int id;

  const GetMovieDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class GetMovieRecommendationEvent extends MovieDetailsEvent{
  final int id;

  const GetMovieRecommendationEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}