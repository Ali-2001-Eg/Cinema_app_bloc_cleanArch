part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {}


class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;

  GetTvDetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}


class GetTvRecommendationsEvent extends TvDetailsEvent {
  final int id;

  GetTvRecommendationsEvent({required this.id});

  @override
  List<Object> get props => [id];

}