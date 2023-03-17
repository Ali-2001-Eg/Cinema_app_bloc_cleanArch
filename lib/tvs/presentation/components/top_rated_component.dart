import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/movies/presentation/controller/movies_bloc.dart';
import 'package:payment_app/movies/presentation/controller/movies_states.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_bloc.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_state.dart';
import 'package:payment_app/tvs/presentation/screens/top_rated_details_tvs_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/networks/api_constatnts.dart';
import '../../../core/utils/enums.dart';

class TopRatedTvsComponent extends StatelessWidget {
  const TopRatedTvsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvsBloc, TvsStates>(
      buildWhen: (previous, current) => previous.topRatedRequestState != current.topRatedRequestState,
      builder: (context, state) {
        switch (state.topRatedRequestState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedTvs.length,
                  itemBuilder: (context, index) {
                    final tvs = state.topRatedTvs[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>const TopRatedDetailsTvsScreen(),));
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 200,
                            fit: BoxFit.fill,
                            imageUrl: ApiConstants.imageUrl(tvs.backdropPath!),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
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
    );
  }
}
