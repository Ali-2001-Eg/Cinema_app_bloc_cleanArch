import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/movies/presentation/screens/movies_screen.dart';
import 'package:payment_app/tvs/presentation/screens/tvs_screen.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());
  static HomePageCubit get(context)=> BlocProvider.of(context);
  int currentIndex = 0 ;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
  List<Widget> screens = [
     MoviesScreen(),
     TvsScreen(),
  ];
}
