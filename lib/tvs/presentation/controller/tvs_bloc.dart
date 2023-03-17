import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/core/utils/enums.dart';
import 'package:payment_app/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:payment_app/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:payment_app/tvs/domain/usecases/get_tvs_on_air_usecase.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_event.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_state.dart';

class TvsBloc extends Bloc<TvsEvent, TvsStates> {
  

  TvsBloc(
      this.getTvsOnAirUseCase, this.getPopularTvsUseCase, this.getTopRatedTvsUseCase)
      : super(const TvsStates()) {
    on<GetTvsOnAirEvent>(_getOnAirTvs);
    on<GetTvsPopularEvent>(_getPopularTvs);
    on<GetTvsTopRatedEvent>(_getTopRatedTvs);
  }
  //use cases
  GetTvsOnAirUseCase getTvsOnAirUseCase;
  GetPopularTvsUseCase getPopularTvsUseCase;
  GetTopRatedTvsUseCase getTopRatedTvsUseCase;

  FutureOr<void> _getOnAirTvs(
      GetTvsOnAirEvent event, Emitter<TvsStates> emit) async {
    final result = await getTvsOnAirUseCase(const NoParameters());
    // print('${getIt<MoviesBloc>().hashCode} ');
    result.fold(
            (l) => emit(state.copyWith(
          onAirRequestState: RequestState.error,
          onAirMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          onAirRequestState: RequestState.loaded,
          TvsonAir: r,
        )));
  }



  FutureOr<void> _getPopularTvs(GetTvsPopularEvent event, Emitter<TvsStates> emit) async{
    final result = await getTvsOnAirUseCase(const NoParameters());
    //must use emit state
    result.fold(
            (l) => emit(state.copyWith(
          popularRequestState: RequestState.error,
          popularMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          popularRequestState: RequestState.loaded,
          TvsPopular: r,
        )));

  }

  FutureOr<void> _getTopRatedTvs(GetTvsTopRatedEvent event, Emitter<TvsStates> emit) async{
    final result = await getTopRatedTvsUseCase(const NoParameters());
    // print('${getIt<MoviesBloc>().hashCode} ');
    result.fold(
            (l) => emit(state.copyWith(
          topRatedRequestState: RequestState.error,
          topRatedMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          topRatedRequestState: RequestState.loaded,
          TvsTopRated: r,
        )));
  }
}
