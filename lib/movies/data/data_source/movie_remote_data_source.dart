import 'package:dio/dio.dart';
import 'package:payment_app/core/error/exceptions.dart';
import 'package:payment_app/core/networks/error_message_model.dart';
import 'package:payment_app/movies/data/model/movie_details_model.dart';
import 'package:payment_app/movies/data/model/movie_model.dart';
import 'package:payment_app/movies/data/model/recommendataion_model.dart';
import 'package:payment_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';
import '../../../core/networks/api_constatnts.dart';

abstract class BaseMovieRemoteDataSource {
  //contract class
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularPlayingMovies();
  Future<List<MovieModel>> getTopRatedPlayingMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMoviesRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingPath);
    if (response.statusCode == 200) {
      return List.from(response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      //to throw server exception // expert
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularPlayingMovies() async {
    final response = await Dio().get(ApiConstants.popularPath);
    if (response.statusCode == 200) {
      return List.from(response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedPlayingMovies() async {
    final response = await Dio().get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return List.from(response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.movieDetails(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getMoviesRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e))).toList();
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
