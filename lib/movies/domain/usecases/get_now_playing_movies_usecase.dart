import 'package:dartz/dartz.dart';
import 'package:payment_app/core/error/failure.dart';
import 'package:payment_app/core/usecase/base_usecase.dart';
import 'package:payment_app/movies/domain/entities/movies.dart';
import 'package:payment_app/movies/domain/repository/base_movies_repository.dart';

//for just now playing movies use case
class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{

  //instantiate object to access its properties
  BaseMoviesRepository baseMoviesRepository;

  //pass abstract object to the constructor
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  //implementation of abstract method
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
