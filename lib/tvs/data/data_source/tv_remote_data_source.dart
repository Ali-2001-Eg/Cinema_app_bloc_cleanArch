//contract class

import 'package:dio/dio.dart';
import 'package:payment_app/core/error/exceptions.dart';
import 'package:payment_app/core/networks/api_constatnts.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:payment_app/tvs/data/model/tv_details_model.dart';
import 'package:payment_app/tvs/data/model/tv_model.dart';
import 'package:payment_app/tvs/data/model/tv_recommendations_model.dart';
import 'package:payment_app/tvs/domain/entities/tv_revommendations.dart';
import 'package:payment_app/tvs/domain/usecases/get_tv_details_usecase.dart';

import '../../../core/networks/error_message_model.dart';
import '../../domain/usecases/get_tv_recommendataions_usecase.dart';

abstract class BaseTvRemoteDataSource{
  Future<List<TvModel>> getTvsOnAir();
  Future<List<TvModel>> getTvsPopular();
  Future<List<TvModel>> getTvsTopRated();
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters tvDetailsParameters);
  Future<List<TvRecommendationsModel>> getTvRecommendations(TvRecommendationParameters recommendationParameters);
}


//implementation

class TvsRemoteDataSource extends BaseTvRemoteDataSource{

  @override
  Future<List<TvModel>> getTvsOnAir() async {
    // TODO: implement getTvsOnAir
    final response = await Dio().get(ApiConstants.tvOnAirPath);
    if(response.statusCode ==200){
      return List<TvModel>.from(
          (response.data['results'] as List)
              .map((e) => TvModel.fromJson(e))).toList();
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvsPopular() async {
    // TODO: implement getTvsPopular
    final response = await Dio().get(ApiConstants.tvPopularPath);
    if(response.statusCode ==200){
      return List<TvModel>.from(
          (response.data['results'] as List)
              .map((e) => TvModel.fromJson(e))).toList();
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvsTopRated() async {
    // TODO: implement getTvsTopRated
    final response = await Dio().get(ApiConstants.tvTopRatedPath);
    if(response.statusCode ==200){
      return List<TvModel>.from(
          (response.data['results'] as List)
              .map((e) => TvModel.fromJson(e))).toList();
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters tvDetailsParameters) async {
    // TODO: implement getTvDetails
    final response = await Dio().get(ApiConstants.tvDetails(tvDetailsParameters.tvId));
    // print(response);
    if(response.statusCode == 200){
      return TvDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvRecommendationsModel>> getTvRecommendations(TvRecommendationParameters recommendationParameters) async{
    final response = await Dio().get(ApiConstants.recommendationTvsPath(recommendationParameters.id));
    // print(response);
    if(response.statusCode == 200){
      return  List<TvRecommendationsModel>.from(
          (response.data['results'] as List)
              .map((e) => TvRecommendationsModel.fromJson(e))).toList();
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

}