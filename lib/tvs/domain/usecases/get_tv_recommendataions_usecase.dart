import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/movies/domain/entities/recommendation.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:payment_app/tvs/domain/repository/base_tv_repository.dart';

import '../entities/tv_revommendations.dart';

class GetTvRecommendationsUseCase extends BaseUseCase<List<TvRecommendations>,TvRecommendationParameters>{
  BaseTvRepository baseTvRepository;

  GetTvRecommendationsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvRecommendations>>> call(TvRecommendationParameters parameters) async {
    // TODO: implement call
    return await baseTvRepository.getTvRecommendations(parameters);
  }

}
class TvRecommendationParameters extends Equatable {
  final int id;

  const TvRecommendationParameters(this.id);

  @override
  List<Object> get props => [id];

}