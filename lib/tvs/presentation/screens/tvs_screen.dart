import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/core/services/services_locator.dart';
import 'package:payment_app/core/utils/app_strings.dart';
import 'package:payment_app/movies/presentation/screens/movies_screen.dart';
import 'package:payment_app/tvs/presentation/components/on_air_component.dart';
import 'package:payment_app/tvs/presentation/components/popular_component.dart';
import 'package:payment_app/tvs/presentation/components/top_rated_component.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_bloc.dart';
import 'package:payment_app/tvs/presentation/controller/tvs_event.dart';



class TvsScreen extends StatelessWidget {
  const TvsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<TvsBloc>()
          ..add(GetTvsOnAirEvent())
          ..add(GetTvsPopularEvent())
          ..add(GetTvsTopRatedEvent()),

        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('tvsScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnAirTvsComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.popular,
                        style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesScreen(),));

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                AppStrings.seeMore,
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16.0, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularTvsComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.topRated,
                        style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO Top Rated Movies Screen
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesScreen(),));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                AppStrings.seeMore,
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16.0, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedTvsComponent(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
