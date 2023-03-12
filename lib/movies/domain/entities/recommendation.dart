import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  //could be null
  final String? backdropPath;
  final int id;

  const Recommendation({ this.backdropPath,required this.id});

  @override
  List<Object?> get props => [backdropPath,id];
}