import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:payment_app/tvs/domain/entities/tv.dart';
import 'package:payment_app/tvs/domain/entities/tv_details.dart';
import 'package:payment_app/tvs/domain/entities/tv_revommendations.dart';
import 'package:payment_app/tvs/domain/usecases/get_tv_details_usecase.dart';

import '../usecases/get_tv_recommendataions_usecase.dart';

abstract class BaseTvRepository{
  Future<Either<Failure,List<Tv>>>getOnAirPlayingTvs();
  Future<Either<Failure,List<Tv>>>getPopularTvs();
  Future<Either<Failure,List<Tv>>>getTopRatedTvs();
  Future<Either<Failure,TvDetails>>getTvDetails(TvDetailsParameters tvDetailsParameters);
  Future<Either<Failure,List<TvRecommendations>>>getTvRecommendations(TvRecommendationParameters parameters);
}