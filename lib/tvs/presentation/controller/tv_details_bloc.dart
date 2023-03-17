import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/core/utils/enums.dart';
import 'package:payment_app/tvs/domain/entities/tv_details.dart';
import 'package:payment_app/tvs/domain/usecases/get_tv_details_usecase.dart';

import '../../../movies/domain/usecases/get_recommendation_usecase.dart';
import '../../domain/entities/tv_revommendations.dart';
import '../../domain/usecases/get_tv_recommendataions_usecase.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvRecommendationsUseCase getTvRecommendationsUseCase;
  TvDetailsBloc(this.getTvDetailsUseCase,this.getTvRecommendationsUseCase) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetailsEvent);
    on<GetTvRecommendationsEvent>(_getTvRecommendations);
  }

  FutureOr<void> _getTvDetailsEvent(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getTvDetailsUseCase(TvDetailsParameters(event.id));

    result.fold(
        (l) => emit(
              state.copyWith(
                  detailsRequestState: RequestState.error,
                  tvDetailsMessage: l.message),
            ),
        (r) => emit(state.copyWith(
              detailsRequestState: RequestState.loaded,
              tvDetails: r,
            )));
  }

  FutureOr<void> _getTvRecommendations(GetTvRecommendationsEvent event, Emitter<TvDetailsState> emit)async{

    final result = await getTvRecommendationsUseCase(TvRecommendationParameters(event.id));
    // print(result);
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
