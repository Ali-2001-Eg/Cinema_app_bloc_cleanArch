import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/exceptions.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:payment_app/movies/domain/entities/movie_details.dart';
import 'package:payment_app/movies/domain/entities/movies.dart';
import 'package:payment_app/movies/domain/entities/recommendation.dart';
import 'package:payment_app/movies/domain/repository/base_movies_repository.dart';
import 'package:payment_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';

//implementation of contract repo
class MovieRepository extends BaseMoviesRepository {
  //contract with abstract class
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMoviesRecommendation(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMoviesRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }




}
