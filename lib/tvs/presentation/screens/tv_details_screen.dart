import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/core/utils/home_page/bottom_nav_bar.dart';
import 'package:payment_app/tvs/domain/usecases/get_tv_details_usecase.dart';
import 'package:payment_app/tvs/presentation/screens/tvs_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/networks/api_constatnts.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/dummy (1).dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/tv_details.dart';
import '../controller/tv_details_bloc.dart';

class TvDetailsScreen extends StatelessWidget {
  final int id;

  const TvDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('build');
    return BlocProvider(
      create: (context) => sl<TvDetailsBloc>()
        ..add(GetTvDetailsEvent(id: id))
        ..add(GetTvRecommendationsEvent(id: id)),
      child: BlocBuilder<TvDetailsBloc, TvDetailsState>(
        buildWhen: (previous, current) =>
            previous.detailsRequestState != current.detailsRequestState,
        builder: (context, state) {
          // print('tv details is ${state.tvDetails}');
          switch (state.detailsRequestState) {
            case RequestState.loading:
              return const SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            case RequestState.loaded:
              return SafeArea(
                child: Scaffold(
                    body: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      actions: [
                        IconButton(onPressed: ()=>
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const HomePage(),)
                            ), icon: const Icon(Icons.home))
                      ],

                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.5, 1.0, 1.0],
                              ).createShader(
                                Rect.fromLTRB(
                                    0.0, 0.0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              imageUrl: ApiConstants.imageUrl(
                                  state.tvDetails!.backdropPath!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.tvDetails!.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  )),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      state.tvDetails!.firstAirDate
                                          .split('-')[0],
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        (state.tvDetails!.voteAverage / 2)
                                            .toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '(${state.tvDetails!.voteAverage})',
                                        style: const TextStyle(
                                          fontSize: 1.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '${state.tvDetails!.seasonsNo} Season',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text(
                                        '24 min',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                state.tvDetails!.overview,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${AppStrings.geners}: ${_showGenres(state.tvDetails!.geners)}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final recommendation = state.recommendations[index];
                            // print(state.recommendations.length);
                            return FadeInUp(
                              from: 20,
                              duration: const Duration(milliseconds: 500),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TvDetailsScreen(
                                              id: recommendation.id),
                                        ));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: ApiConstants.imageUrl(
                                        recommendation.backdropPath!),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    height: 180.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: state.recommendations.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                          crossAxisCount: 3,
                        ),
                      ),
                    ),
                  ],
                )),
              );
            case RequestState.error:
              return SizedBox(
                height: 400,
                child: Center(
                  child: Text(state.tvDetailsMessage),
                ),
              );
          }
        },
      ),
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
