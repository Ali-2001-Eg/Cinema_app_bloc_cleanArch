import 'package:dartz/dartz.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/tvs/domain/entities/tv.dart';
import 'package:payment_app/tvs/domain/repository/base_tv_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularTvsUseCase extends BaseUseCase<List<Tv>,NoParameters>{
  BaseTvRepository baseTvRepository;

  GetPopularTvsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) {
    return baseTvRepository.getPopularTvs();
  }
}