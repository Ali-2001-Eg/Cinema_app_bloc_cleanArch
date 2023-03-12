import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/core/utils/enums.dart';
import 'package:payment_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:payment_app/movies/presentation/controller/movies_event.dart';
import 'package:payment_app/movies/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesStates()) {
    //now playing
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    //popular
    on<GetPopularMoviesEvent>(_getPopularMovies);
    //top rated
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

}

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async{
    //callable class that invoked like a function implemented
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    // print('${getIt<MoviesBloc>().hashCode} ');
    result.fold(
            (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        )));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async{
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        )));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        )));
  }
}
