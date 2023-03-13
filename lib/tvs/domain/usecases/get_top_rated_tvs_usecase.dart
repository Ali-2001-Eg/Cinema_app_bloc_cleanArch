import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/tvs/domain/entities/tv.dart';
import 'package:payment_app/tvs/domain/repository/base_tv_repository.dart';

class GetTopRatedTvsUseCase extends BaseUseCase<List<Tv>,NoParameters>{
  BaseTvRepository baseTvRepository;

  GetTopRatedTvsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    // TODO: implement call
    return await baseTvRepository.getTopRatedTvs();
  }

}