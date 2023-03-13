import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomePageCubit(),
  child: BlocConsumer<HomePageCubit, HomePageState>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = HomePageCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Container(decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow:  <BoxShadow>[
                BoxShadow(
                  color: Colors.white70.withOpacity(0.3),
                  blurRadius: 9,
                  spreadRadius: 5,
                  offset: Offset(-5,-5)
                )
              ]
            ),child: const Icon(Icons.movie,color: Colors.white,)),label: 'movies'),
             BottomNavigationBarItem(icon: Container(decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,
                 borderRadius: BorderRadius.circular(20),
                 boxShadow:  <BoxShadow>[
                   BoxShadow(
                       color: Colors.white70.withOpacity(0.3),
                       blurRadius: 9,
                       spreadRadius: 5,
                       offset: Offset(-5,-5)
                   )
                 ]),child:const Icon(Icons.tv,color: Colors.white,)),label: 'tv'),
          ],
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: cubit.currentIndex,
          onTap: (int index) {
            cubit.changeIndex(index);
          },
        ),
      ),
    );
  },
),
);
  }
}
