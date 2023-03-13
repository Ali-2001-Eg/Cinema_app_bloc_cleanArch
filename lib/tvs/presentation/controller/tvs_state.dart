import 'package:equatable/equatable.dart';
import 'package:payment_app/core/utils/enums.dart';

import '../../domain/entities/tv.dart';

class TvsStates extends Equatable {
  final List<Tv> TvsonAir;
  final RequestState onAirRequestState;
  final String onAirMessage;
  final List<Tv> popularTvs;
  final RequestState popularRequestState;
  final String popularMessage;
  final List<Tv> topRatedTvs;
  final RequestState topRatedRequestState;
  final String topRatedMessage;

  const TvsStates({
    this.TvsonAir = const [],
    this.onAirRequestState = RequestState.loading,
    this.onAirMessage = '',
    this.popularTvs = const [],
    this.popularRequestState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTvs = const [],
    this.topRatedRequestState = RequestState.loading,
    this.topRatedMessage = '',
  });

  @override
  List<Object> get props => [
        TvsonAir,
        onAirRequestState,
        onAirMessage,
        popularTvs,
        popularRequestState,
        popularMessage,
        topRatedTvs,
        topRatedRequestState,
        topRatedMessage,
      ];

  TvsStates copyWith({
    List<Tv>? TvsonAir,
    RequestState? onAirRequestState,
    String? onAirMessage,
    List<Tv>? TvsPopular,
    RequestState? popularRequestState,
    String? popularMessage,
    List<Tv>? TvsTopRated,
    RequestState? topRatedRequestState,
    String? topRatedMessage,
  }) {
    return TvsStates(
      TvsonAir: TvsonAir ?? this.TvsonAir,
      onAirRequestState: onAirRequestState ?? this.onAirRequestState,
      onAirMessage: onAirMessage ?? this.onAirMessage,
      popularTvs: TvsPopular ?? this.popularTvs,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTvs: TvsTopRated ?? this.topRatedTvs,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
}
