import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';

// type T because we may make movie or movie details
//parameters to receive parameters fromm UI
abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}
class NoParameters extends Equatable{

  const NoParameters();

  @override
  List<Object> get props => [] ;
}