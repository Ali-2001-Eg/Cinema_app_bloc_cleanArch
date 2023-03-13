//contract class

import 'package:dio/dio.dart';
import 'package:payment_app/core/error/exceptions.dart';
import 'package:payment_app/core/networks/api_constatnts.dart';
import 'package:payment_app/tvs/data/model/tv_model.dart';

import '../../../core/networks/error_message_model.dart';

abstract class BaseTvRemoteDataSource{
  Future<List<TvModel>> getTvsOnAir();
  Future<List<TvModel>> getTvsPopular();
  Future<List<TvModel>> getTvsTopRated();
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

}