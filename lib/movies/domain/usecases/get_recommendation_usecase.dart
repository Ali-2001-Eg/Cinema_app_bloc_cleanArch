import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/movies/domain/entities/recommendation.dart';

import '../repository/base_movies_repository.dart';

class GetMoviesRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetMoviesRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
    return await baseMoviesRepository.getMoviesRecommendation(parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];

}