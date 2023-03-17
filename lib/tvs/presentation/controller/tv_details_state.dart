part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  final TvDetails? tvDetails;
  final RequestState detailsRequestState;
  final String tvDetailsMessage;
  final List<TvRecommendations> recommendations;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  const TvDetailsState({
    this.tvDetails,
    this.detailsRequestState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = ''
  });

  TvDetailsState copyWith({
    TvDetails? tvDetails,
    RequestState? detailsRequestState,
    String? tvDetailsMessage,
    List<TvRecommendations>? recommendations,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      detailsRequestState: detailsRequestState ?? this.detailsRequestState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationRequestState: recommendationRequestState ?? this.recommendationRequestState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        tvDetails,
        detailsRequestState,
        tvDetailsMessage,
        recommendations,
        recommendationRequestState,
        recommendationMessage,
      ];
}
