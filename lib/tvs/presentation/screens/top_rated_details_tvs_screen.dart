import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/details_widget.dart';
import '../../../core/utils/enums.dart';
import '../controller/tvs_bloc.dart';
import '../controller/tvs_event.dart';
import '../controller/tvs_state.dart';

class TopRatedDetailsTvsScreen extends StatelessWidget {
  const TopRatedDetailsTvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
  create: (context) => sl<TvsBloc>()..add(GetTvsTopRatedEvent()),
  child: BlocBuilder<TvsBloc, TvsStates>(
    buildWhen: (previous, current) => previous.topRatedRequestState != current.topRatedRequestState,
  builder: (context, state) {
      switch(state.topRatedRequestState){

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
                  title: Text('Top Rated Tvs'),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.black,
                ),
                body: ListView.separated(
                  physics: const BouncingScrollPhysics(),

                  itemCount: state.topRatedTvs.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  itemBuilder: (context, index) => DetailsWidget(
                    title: state.topRatedTvs[index].name,
                    overview: state.topRatedTvs[index].overview,
                    voteAverage: state.topRatedTvs[index].voteAverage.toDouble(),
                    releaseDate: state.topRatedTvs[index].firstAirDate,
                    imagePath: state.topRatedTvs[index].backdropPath!,
                  ),
                ),
              ));
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
