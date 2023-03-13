import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/details_widget.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_event.dart';
import '../controller/movies_states.dart';

class TopRatedDetailsScreen extends StatelessWidget {
  const TopRatedDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        buildWhen: (previous, current) =>
        previous.topRatedState != current.topRatedState,
        builder: (context, state) {
          switch(state.topRatedState){

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
                     'Top Rated Movies',
                     style: TextStyle(color: Colors.white),
                   ),
                   centerTitle: true,
                   backgroundColor: Colors.black,
                 ),
                 body: ListView.separated(
                   itemCount: state.topRatedMovies.length,
                   separatorBuilder: (context, index) => SizedBox(
                     height: MediaQuery.of(context).size.height / 20,
                   ),
                   itemBuilder: (context, index) => DetailsWidget(
                     title: state.topRatedMovies[index].title,
                     releaseDate: state.topRatedMovies[index].releaseDate,
                     voteAverage: state.topRatedMovies[index].voteAverage,
                     overview: state.topRatedMovies[index].overview,
                     imagePath: state.topRatedMovies[index].backdropPath,
                   ),
                 ),
               ),
             );
            case RequestState.error:
              return SizedBox(
                height: 170,
                child: Center(
                  child: Text(state.topRatedMessage),
                ),
              );

          }

        },
      ),
    );

  }
}
