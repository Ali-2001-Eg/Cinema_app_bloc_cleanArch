import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/enums.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_bloc.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_event.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_state.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/details_widget.dart';

class PopularTvsScreen extends StatelessWidget {
  const PopularTvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvsBloc>()..add(GetTvsPopularEvent()),
      child: BlocBuilder<TvsBloc, TvsStates>(
        buildWhen: (previous, current) =>
            previous.popularRequestState != current.popularRequestState,
        builder: (context, state) {
          switch (state.popularRequestState) {
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
                      'Popular Tvs',
                      style: TextStyle(color: Colors.white),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.black,
                  ),
                  body: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.popularTvs.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    itemBuilder: (context, index) => DetailsWidget(
                      title: state.popularTvs[index].name,
                      releaseDate: state.popularTvs[index].firstAirDate,
                      voteAverage:
                          state.popularTvs[index].voteAverage.toDouble(),
                      overview: state.popularTvs[index].overview,
                      imagePath: state.popularTvs[index].backdropPath!,
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
