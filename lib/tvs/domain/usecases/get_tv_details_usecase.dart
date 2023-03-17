import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/tvs/domain/entities/tv_details.dart';
import 'package:payment_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails,TvDetailsParameters> {
  BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameters parameters) {
    // TODO: implement call
    return baseTvRepository.getTvDetails(parameters);
  }

}


class TvDetailsParameters extends Equatable {
  final int tvId;

  const TvDetailsParameters(this.tvId);

  @override
  List<Object> get props => [tvId];
}