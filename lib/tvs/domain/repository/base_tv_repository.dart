import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/tvs/domain/entities/tv.dart';

abstract class BaseTvRepository{
  Future<Either<Failure,List<Tv>>>getOnAirPlayingTvs();
  Future<Either<Failure,List<Tv>>>getPopularTvs();
  Future<Either<Failure,List<Tv>>>getTopRatedTvs();
}