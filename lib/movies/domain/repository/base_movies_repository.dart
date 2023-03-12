import 'package:dartz/dartz.dart';
import 'package:payment_app/movies/domain/entities/movie_details.dart';
import 'package:payment_app/movies/domain/entities/movies.dart';
import 'package:payment_app/movies/domain/entities/recommendation.dart';
import 'package:payment_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularPlayingMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedPlayingMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getMoviesRecommendation(RecommendationParameters parameters);
}
