import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/exceptions.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:payment_app/tvs/domain/entities/tv.dart';
import 'package:payment_app/tvs/domain/entities/tv_details.dart';
import 'package:payment_app/tvs/domain/entities/tv_revommendations.dart';
import 'package:payment_app/tvs/domain/repository/base_tv_repository.dart';
import 'package:payment_app/tvs/domain/usecases/get_tv_details_usecase.dart';

import '../../domain/usecases/get_tv_recommendataions_usecase.dart';
import '../data_source/tv_remote_data_source.dart';


//implementation of base repository and linked with data source

class TvRepository extends BaseTvRepository{

  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnAirPlayingTvs() async {
    // TODO: implement getOnAirPlayingTvs
    final result = await baseTvRemoteDataSource.getTvsOnAir();
    try{
      return Right(result);

    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTvs() async {
    // TODO: implement getPopularTvs
    final result = await baseTvRemoteDataSource.getTvsPopular();
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTvs() async {
    // TODO: implement getTopRatedTvs
    final result = await baseTvRemoteDataSource.getTvsTopRated();
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(TvDetailsParameters tvDetailsParameters) async {
    // TODO: implement getTvDetails
    final result = await baseTvRemoteDataSource.getTvDetails(tvDetailsParameters);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendations>>> getTvRecommendations(TvRecommendationParameters parameters) async{
    final result = await baseTvRemoteDataSource.getTvRecommendations(parameters);
    // print(result);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }



}