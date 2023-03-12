import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/movies/domain/entities/movies.dart';
import 'package:payment_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/usecase/base_usecase.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{

  BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters)async{
    return await baseMoviesRepository.getPopularPlayingMovies();
  }
}