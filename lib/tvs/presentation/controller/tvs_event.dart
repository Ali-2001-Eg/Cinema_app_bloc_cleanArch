

import 'package:equatable/equatable.dart';

abstract class TvsEvent extends Equatable {
  const TvsEvent();

  @override
  List<Object> get props => [];
}

class GetTvsOnAirEvent extends TvsEvent{}

class GetTvsPopularEvent extends TvsEvent{}

class GetTvsTopRatedEvent extends TvsEvent{}
