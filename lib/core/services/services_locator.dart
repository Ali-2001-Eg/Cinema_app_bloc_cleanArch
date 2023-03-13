import 'package:get_it/get_it.dart';
import 'package:payment_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:payment_app/movies/data/repository/movies_repository.dart';
import 'package:payment_app/movies/domain/repository/base_movies_repository.dart';
import 'package:payment_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:payment_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:payment_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:payment_app/movies/presentation/controller/movies_bloc.dart';
import 'package:payment_app/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:payment_app/tvs/data/repository/tv_repository.dart';
import 'package:payment_app/tvs/domain/repository/base_tv_repository.dart';
import 'package:payment_app/tvs/domain/usecases/get_popular_tvs_usecase.dart';
import 'package:payment_app/tvs/domain/usecases/get_top_rated_tvs_usecase.dart';
import 'package:payment_app/tvs/domain/usecases/get_tvs_on_air_usecase.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
    //inject the object to movie repository like Get.find;
  void init() {

    ///Bloc when user is inside system create a new object
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl(),));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    sl.registerFactory(() => TvsBloc(sl(),sl(),sl()));



    ///USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUSeCase(sl()));
    sl.registerLazySingleton(() => GetMoviesRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvsOnAirUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));


    //DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseTvRemoteDataSource>(() => TvsRemoteDataSource());


  }
}
