import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/movies/domain/entities/movie_details.dart';
import 'package:payment_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUSeCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUSeCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) {
    return baseMoviesRepository.getMovieDetails(parameters);
  }


}

class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}


