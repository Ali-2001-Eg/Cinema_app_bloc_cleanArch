import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/enums.dart';
import 'package:payment_app/movies/domain/entities/movie_details.dart';
import 'package:payment_app/movies/domain/entities/recommendation.dart';
import 'package:payment_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      this.getMovieDetailsUSeCase, this.getMoviesRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendationEvent>(_getMovieRecommendationEvent);
  }

  final GetMovieDetailsUSeCase getMovieDetailsUSeCase;
  final GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    //we have passed id in the event class
    final result =
        await getMovieDetailsUSeCase(MovieDetailsParameters(event.id));
    result.fold(
      (l) => emit(state.copyWith(
        requestState: RequestState.error,
        message: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetails: r,
        requestState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getMovieRecommendationEvent(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMoviesRecommendationUseCase(
        RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationMessage: l.message,
              recommendationRequestState: RequestState.error,
            )),
        (r) => emit(
              state.copyWith(
                  recommendations: r,
                  recommendationRequestState: RequestState.loaded),
            ));
  }
}
