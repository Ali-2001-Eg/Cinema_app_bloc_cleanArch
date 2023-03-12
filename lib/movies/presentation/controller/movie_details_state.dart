part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieRequestState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendations;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? requestState,
    String? message,
    List<Recommendation>? recommendations,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieRequestState: requestState ?? this.movieRequestState,
      movieDetailsMessage: message ?? this.movieDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationRequestState: recommendationRequestState ??
          this.recommendationRequestState,
      recommendationMessage: recommendationMessage ??
          this.recommendationMessage,
    );
  }

  const MovieDetailsState({
    this.movieDetails,
    this.movieRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = '',
  });

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieRequestState,
        movieDetailsMessage,
        recommendations,
        recommendationRequestState,
        recommendationMessage,
      ];
}
