import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/dummy.dart';
import 'package:payment_app/movies/presentation/controller/movies_bloc.dart';
import 'package:payment_app/movies/presentation/controller/movies_states.dart';
import 'package:payment_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_state.dart';
import 'package:payment_app/tvs/presentation/screens/tv_details_screen.dart';

import '../../../core/networks/api_constatnts.dart';
import '../../../core/utils/enums.dart';
import '../controller/tvs_bloc.dart';


class OnAirTvsComponent extends StatelessWidget {
  const OnAirTvsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      //to improve performance and decrease number of builds
      buildWhen: (previous, current) =>
      previous.onAirRequestState != current.onAirRequestState,
      builder: (context, state) {
        // will print twice loading state and loaded state
        //  print(state.onAirRequestState);
        switch (state.onAirRequestState) {
          case RequestState.loading:
          // print('loading');
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator(
              ),),
            );

          case RequestState.loaded:
          // print(state.TvsonAir);
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {},
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  autoPlay: true,
                ),
                items: state.TvsonAir.map(
                      (item) {
                    return GestureDetector(
                      key: const Key('openTvMinimalDetail'),
                      onTap: () {
                        // print (item.id);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TvDetailsScreen(id: item.id),));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl: ApiConstants.imageUrl(
                                  item.backdropPath!),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'On the air'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.white

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestState.error:
          // print('error');
            return SizedBox(
              height: 400,
              child: Center(child: Text(state.onAirMessage),),
            );
        }
      },

    );
  }
}
