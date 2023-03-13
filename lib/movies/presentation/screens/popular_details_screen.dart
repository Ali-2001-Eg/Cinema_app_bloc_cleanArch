import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/details_widget.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_event.dart';
import '../controller/movies_states.dart';

class PopularDetailsScreen extends StatelessWidget {
  const PopularDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        buildWhen: (previous, current) =>
            previous.popularState != current.popularState,
        builder: (context, state) {
          switch(state.popularState){

            case RequestState.loading:
              return const SizedBox(
                height: 170,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.loaded:
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'Popular Movies',
                      style: TextStyle(color: Colors.white),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.black,
                  ),
                  body: ListView.separated(
                    itemCount: state.popularMovies.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    itemBuilder: (context, index) => DetailsWidget(
                      title: state.popularMovies[index].title,
                      releaseDate: state.popularMovies[index].releaseDate,
                      voteAverage: state.popularMovies[index].voteAverage,
                      overview: state.popularMovies[index].overview,
                      imagePath: state.popularMovies[index].backdropPath,
                    ),
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 170,
                child: Center(
                  child: Text(state.popularMessage),
                ),
              );

          }

        },
      ),
    );
  }
}
